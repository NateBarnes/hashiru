class Exercise < ActiveRecord::Base
  has_many :workout_exercises, :dependent => :destroy
  has_many :workouts, :through => :workout_exercises
  has_one :general_efficacy, :dependent => :destroy
  has_many :cluster_efficacies, :dependent => :destroy

  after_create :create_efficacies

  def self.distance_run
    Exercise.find_by_name "Long Slow Run"
  end

  def self.speed_run
    Exercise.find_by_name "Fast 1 Mile"
  end

  def create_efficacies
    GeneralEfficacy.create :exercise_id => self.id, :speed_score => 0, :distance_score => 0, :general_score => 0
  end
end
