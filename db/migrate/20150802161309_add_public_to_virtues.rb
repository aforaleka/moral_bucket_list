class AddPublicToVirtues < ActiveRecord::Migration
  def change
    add_column :virtues, :public, :boolean
  end
end
