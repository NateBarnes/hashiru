class GeneralEfficacyGenerator
  include Sidekiq::Worker

  def perform
    general_efficacy_hash = { :speed => {}, :distance => {} }
    User.all.each do |user|
      user_efficacy_hash = UserEfficacyGenerator.new.perform user
      general_efficacy_hash.fetch(:speed, {}).merge_or_add user_efficacy_hash.fetch(:speed, {})
      general_efficacy_hash.fetch(:distance, {}).merge_or_add user_efficacy_hash.fetch(:distance, {})
    end

    general_efficacy_hash
  end

private
  def save_efficacy efficacy_hash

  end
end

