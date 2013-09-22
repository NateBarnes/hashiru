class MoveMeasurements < ActiveRecord::Migration
  def change
    remove_column :measurements, :workout_id
    remove_column :measurements, :exercise_id
    add_column :measurements, :workout_exercise_id, :integer
  end
end
