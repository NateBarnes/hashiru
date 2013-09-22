class User < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  validates_presence_of :name, :gender, :mile_time, :longest_distance, :goal_type
  has_many :workouts, :dependent => :destroy
  has_many :workout_exercises, :through => :workouts
  has_one :event

  after_save :recluster

  def has_event?
    event.present?
  end

  def save_mile_time_with_minutes_and_seconds minutes, seconds
    milliseconds = (minutes.to_i * 60 + seconds.to_i) * 1000
    self.mile_time = milliseconds
  end

  def mile_time_minutes
    (mile_time.to_i/1000) / 60
  end

  def mile_time_seconds
    (mile_time.to_i/1000) % 60
  end

  def gender_num
    if gender == "male"
      1
    else
      0
    end
  end

  def recluster
    UserClusterGenerator.perform_async gender_num, mile_time, longest_distance
  end

  def goal_score
    if goal_type == "both"
      "general"
    elsif goal_type == "faster"
      "speed"
    else
      "distance"
    end
  end

  def search_goal
    if self.longest_distance < 3.1 or ( self.longest_distance > 3.1 and self.longest_distance < 6.2 and self.goal_type == "faster" )
      "5k"
    elsif self.longest_distance > 3.1 and self.longest_distance < 6.2 or ( self.longest_distance > 6.2 and self.longest_distance < 13.1 and self.goal_type == "faster" )
      "10k"
    elsif self.longest_distance > 6.2 and self.longest_distance < 13.1 or ( self.longest_distance > 13.1 and self.longest_distance < 26.2 and self.goal_type == "faster" )
      "half marathon"
    elsif self.longest_distance > 13.1 and self.longest_distance < 26.2 or ( self.longest_distance > 26.2 and self.longest_distance < 50 and self.goal_type == "faster" )
      "marathon"
    else
      "ultra marathon"
    end
  end

  def exercise_history exercise
    hsh = {}
    workout_exercises.where(:exercise_id => exercise.id).load.each do |workout_exercise|
      JSON.parse(workout_exercise.exercise.units).each do |unit|
        hsh.merge_or_add unit => [workout_exercise.measurements.where(:unit => unit).first.value]
      end
      hsh.merge_or_add "timestamps" => [workout_exercise.workout.day.to_i]
    end

    hsh
  end
end

