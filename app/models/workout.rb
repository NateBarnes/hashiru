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
    exercises = [
      Exercise.find_by_name("Push Ups"),
      Exercise.find_by_name("Fast 1 Mile")
    ]
    workout = user.workouts.build day: Date.today, exercises: exercises
    exercises.each do |exercise|
      JSON.parse(exercise.units).each do |unit|
        workout.measurements.build unit: unit, value: 5, exercise: exercise
      end
    end
    workout
  end

end

