class Exercise < ActiveRecord::Base
  has_many :workout_exercises, :dependent => :destroy
  has_many :workouts, :through => :workout_exercises

  def self.distance_run
    Exercise.find_by_name "Long Slow Run"
  end

  def self.speed_run
    Exercise.find_by_name "Fast 1 Mile"
  end
end
