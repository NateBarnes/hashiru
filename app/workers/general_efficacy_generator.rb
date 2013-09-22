class GeneralEfficacyGenerator
  include Sidekiq::Worker

  def perform
    general_efficacy_hash = { :speed => {}, :distance => {} }
    User.all.each do |user|
      user_efficacy_hash = UserEfficacyGenerator.new.perform user
      general_efficacy_hash.fetch(:speed, {}).merge_or_add user_efficacy_hash.fetch(:speed, {})
      general_efficacy_hash.fetch(:distance, {}).merge_or_add user_efficacy_hash.fetch(:distance, {})
    end

    general_efficacy_hash = Efficacy.convert_to_percentages general_efficacy_hash
    save_efficacy general_efficacy_hash

    general_efficacy_hash
  end

private
  def save_efficacy efficacy_hash
    Exercise.all.each do |exercise|
      exercise.general_efficacy.update_attributes :speed_score => efficacy_hash[:speed].fetch(exercise.id, 0.0), :distance_score => efficacy_hash[:distance].fetch(exercise.id, 0.0), :general_score => efficacy_hash[:general].fetch(exercise.id, 0.0)
    end
  end
end

