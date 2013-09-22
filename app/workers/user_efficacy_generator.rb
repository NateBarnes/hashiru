class UserEfficacyGenerator
  include Sidekiq::Worker

  def perform user
    user_efficacy_hash = { :speed => {}, :distance => {} }
    User.where(:cluster => user.cluster).load.each do |user|
      user_efficacy_hash = generate_exercise_hash user
    end

    user_efficacy_hash = Efficacy.convert_to_percentages user_efficacy_hash

    user_efficacy_hash
  end

  def perform_and_return user
    generate_exercise_hash user
  end

private
  def generate_exercise_hash user
    speed_hash = generate_delta_hash user, :speed
    distance_hash = generate_delta_hash user, :distance

    { :speed => speed_hash, :distance => distance_hash }
  end

  def generate_delta_hash user, type
    exercise_deltas = {}
    benchmark_workout_exercises = WorkoutExercise.where(WorkoutExercise.arel_table["exercise_id"].eq(Exercise.send("#{type.to_s}_run").id)).joins(:workout).where(Workout.arel_table["user_id"].eq(user.id)).order(Workout.arel_table[:day])
    benchmark_workout_exercises.each_with_index do |first_workout_exercise, idx|
      first_workout = first_workout_exercise.workout
      unless idx+1 >= benchmark_workout_exercises.size
        second_workout_exercise = benchmark_workout_exercises[idx+1]
        exercise_deltas = exercise_deltas.merge_or_add(generate_deltas_for_qualifying_workouts(user, first_workout_exercise, second_workout_exercise, type))
      end
    end

    exercise_deltas
  end

  def generate_deltas_for_qualifying_workouts user, start_workout_exercise, end_workout_exercise, type
    exercise_hash = {}
    workouts_in_range = Workout.where(:user_id => user.id).where(Workout.arel_table[:day].gt(start_workout_exercise.workout.day)).where(Workout.arel_table[:day].lt(end_workout_exercise.workout.day)).load
    workout_exercises = []
    workouts_in_range.each do |workout|
      workout_exercises += workout.workout_exercises
    end
    workout_exercises.each do |we|
      result = compute_score(start_workout_exercise, end_workout_exercise, we, type)
      exercise_hash = exercise_hash.merge_or_add(result)
    end

    exercise_hash
  end

  def compute_score start_workout_exercise, end_workout_exercise, workout_exercise_to_score, type
    if type == :speed
      if start_workout_exercise.measurements.where(:unit => "minutes").first.value > end_workout_exercise.measurements.where(:unit => "miles").first.value
        { workout_exercise_to_score.exercise.id => [1] }
      else
        { workout_exercise_to_score.exercise.id => [0] }
      end
    else
      if start_workout_exercise.measurements.where(:unit => "miles").first.value < end_workout_exercise.measurements.where(:unit => "miles").first.value
        { workout_exercise_to_score.exercise.id => [1] }
      else
        { workout_exercise_to_score.exercise.id => [0] }
      end
    end
  end
end

