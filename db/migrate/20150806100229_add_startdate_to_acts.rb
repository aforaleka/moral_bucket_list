class AddStartdateToActs < ActiveRecord::Migration
  def change
    add_column :acts, :startdate, :datetime
  end
end
