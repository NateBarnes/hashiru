class ClusterEfficacyGenerator
  include Sidekiq::Worker

  def perform
    perform_cluster 0
    perform_cluster 1
  end

private
  def perform_cluster cluster
    cluster_efficacy_hash = { :speed => {}, :distance => {} }
    User.where(:cluster => cluster).load.each do |user|
      user_efficacy_hash = UserEfficacyGenerator.new.perform_and_return user
      cluster_efficacy_hash[:speed] = cluster_efficacy_hash.fetch(:speed, {}).merge_or_add user_efficacy_hash.fetch(:speed, {})
      cluster_efficacy_hash[:distance] = cluster_efficacy_hash.fetch(:distance, {}).merge_or_add user_efficacy_hash.fetch(:distance, {})
    end

    cluster_efficacy_hash = Efficacy.convert_to_percentages cluster_efficacy_hash
    save_efficacy cluster_efficacy_hash, cluster

    cluster_efficacy_hash
  end

  def save_efficacy efficacy_hash, cluster
    Exercise.all.each do |exercise|
      exercise.cluster_efficacies.create!({ :cluster => cluster }) if exercise.cluster_efficacies.where(:cluster => cluster).empty?
      exercise.cluster_efficacies.where(:cluster => cluster).first.update_attributes! :speed_score => efficacy_hash[:speed].fetch(exercise.id, 0.0), :distance_score => efficacy_hash[:distance].fetch(exercise.id, 0.0), :general_score => efficacy_hash[:general].fetch(exercise.id, 0.0)
    end
  end
end

