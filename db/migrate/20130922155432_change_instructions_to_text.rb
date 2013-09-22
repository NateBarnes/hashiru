class ChangeInstructionsToText < ActiveRecord::Migration
  def change
    change_column :exercises, :instructions, :text
  end
end
