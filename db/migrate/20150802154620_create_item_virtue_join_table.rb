class CreateItemVirtueJoinTable < ActiveRecord::Migration
  def change
    create_join_table :items, :virtues do |t|
      # t.index [:item_id, :virtue_id]
      # t.index [:virtue_id, :item_id]
    end
  end
end
