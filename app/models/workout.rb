class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :workout_exercises, :dependent => :destroy
  has_many :exercises, :through => :workout_exercises
  has_many :measurements, :through => :workout_exercises
  accepts_nested_attributes_for :measurements

  after_save :repopulate_efficacy
  def repopulate_efficacy
    GeneralEfficacyGenerator.perform_async
  end

  def self.generate user
    exercises = WorkoutGenerator.new(user).generate
    workout = user.workouts.create day: Date.today, exercises: exercises
    workout.workout_exercises.each do |workout_exercise|
      JSON.parse(workout_exercise.exercise.units).each do |unit|
        measurement = workout.measurements.build unit: unit, value: predict_value(user, workout_exercise, unit), workout_exercise_id: workout_exercise.id
        measurement.save
      end
    end
    workout
  end

  def self.predict_value user, workout_exercise, unit
    val = 5
    begin
      units_hash = user.exercise_history workout_exercise.exercise
      timestamps = units_hash.delete "timestamps"
      lr = LinearRegression.new(timestamps.fetch("timestamps", []), units_hash.fetch(unit, default_array))

      val = lr.predict(workout_exercise.workout.day.to_i)
    rescue
      puts "Rescuing Regression Prediction"
    end

    val
  end

end

