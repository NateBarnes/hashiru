class AddUnitsAndInstructionsToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :units, :string
    add_column :exercises, :instructions, :string
  end
end
