class User < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  validates_presence_of :name, :gender, :mile_time, :longest_distance, :goal_type
  has_many :workouts, :dependent => :destroy
end
