class RemoveFriendIdFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :friend_id, :integer
  end
end
