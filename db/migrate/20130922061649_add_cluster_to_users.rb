class AddClusterToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cluster, :integer, :default => 0
  end
end
