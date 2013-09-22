class CreateClusterEfficacies < ActiveRecord::Migration
  def change
    create_table :cluster_efficacies do |t|
      t.integer :exercise_id
      t.integer :cluster
      t.float :speed_score
      t.float :distance_score
      t.float :general_score

      t.timestamps
    end
  end
end
