class AddUserIdAndAssetGuidToEvents < ActiveRecord::Migration
  def change
    add_column :events, :user_id, :integer
    add_column :events, :asset_guid, :string
  end
end
