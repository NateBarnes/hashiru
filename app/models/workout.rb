class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :measurements
  has_many :workout_exercises
  has_many :exercises, :through => :workout_exercises
end
