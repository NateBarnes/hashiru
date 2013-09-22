class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :workout_exercises, :dependent => :destroy
  has_many :exercises, :through => :workout_exercises
  has_many :measurements, :through => :workout_exercises

  after_save :repopulate_efficacy

  def repopulate_efficacy
    GeneralEfficacyGenerator.perform_async
  end
end

