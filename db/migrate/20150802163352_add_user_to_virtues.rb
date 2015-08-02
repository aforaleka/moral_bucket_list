class AddUserToVirtues < ActiveRecord::Migration
  def change
    add_reference :virtues, :user, index: true, foreign_key: true
  end
end
