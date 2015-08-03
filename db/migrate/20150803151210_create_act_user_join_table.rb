class CreateActUserJoinTable < ActiveRecord::Migration
  def change
    create_join_table :acts, :users do |t|
      # t.index [:act_id, :user_id]
      # t.index [:user_id, :act_id]
    end
  end
end
