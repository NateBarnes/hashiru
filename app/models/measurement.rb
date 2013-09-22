class Measurement < ActiveRecord::Base
  belongs_to :workout_exercise
  has_one :workout, :through => :workout_exercise
  has_one :exercise, :through => :workout_exercise
end

