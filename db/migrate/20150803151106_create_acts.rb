class CreateActs < ActiveRecord::Migration
  def change
    create_table :acts do |t|
      t.string :name
      t.string :blurb
      t.boolean :completed
      t.integer :karma_points, :default => 0

      t.timestamps null: false
    end
  end
end
