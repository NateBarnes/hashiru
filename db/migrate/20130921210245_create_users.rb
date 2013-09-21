class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :mile_time
      t.float :longest_distance
      t.string :gender

      t.timestamps
    end
  end
end
