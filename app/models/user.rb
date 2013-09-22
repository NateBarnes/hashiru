class User < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  validates_presence_of :name, :gender, :mile_time, :longest_distance, :goal_type
  has_many :workouts, :dependent => :destroy

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

end
