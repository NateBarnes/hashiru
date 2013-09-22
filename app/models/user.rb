class User < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  validates_presence_of :name, :gender, :mile_time, :longest_distance, :goal_type
  has_many :workouts, :dependent => :destroy
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

end
