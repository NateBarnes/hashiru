class CreateGeneralEfficacies < ActiveRecord::Migration
  def change
    create_table :general_efficacies do |t|
      t.integer :exercise_id
      t.float :speed_score
      t.float :distance_score
      t.float :general_score

      t.timestamps
    end
  end
end
