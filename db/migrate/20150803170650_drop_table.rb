class DropTable < ActiveRecord::Migration
  def change
  	drop_table :acts_users
  end
end
