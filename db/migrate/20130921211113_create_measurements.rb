class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.integer :exercise_id
      t.integer :workout_id
      t.string :unit
      t.integer :value

      t.timestamps
    end
  end
end
