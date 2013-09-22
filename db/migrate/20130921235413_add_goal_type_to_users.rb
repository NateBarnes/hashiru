class AddGoalTypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :goal_type, :string, :default => "both"
  end
end
