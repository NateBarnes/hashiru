class GeneralEfficacyGenerator
  include Sidekiq::Worker

  def perform exercise
    deltas = generate_all_deltas exercise
  end

private
  def generate_all_deltas exercise
    speed_deltas = generate_deltas exercise, Exercise.speed_run.id
    distance_deltas = generate_deltas exercise, Exercise.distance_run.id

    [speed_deltas, distance_deltas]
  end

  def generate_deltas exercise, benchmark_id
    deltas = []
    benchmark_workouts = Workout.where(:exercise_id => benchmark_id)
    benchmark_workouts.each_with_index do |first_workout, idx|
      unless idx+1 >= benchmark_workouts.size
        second_workout = benchmark_workouts[idx+1]
        deltas += compute_delta(first_workout, second_workout)
      end
    end
  end

  def compute_delta start_workout, end_workout
    Workout.where(Workout.arel_table[:day].gteq(start_workout)).where(Workout.arel_table[:day].lteq(end_workout))
  end
end
