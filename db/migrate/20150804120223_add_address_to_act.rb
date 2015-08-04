class AddAddressToAct < ActiveRecord::Migration
  def change
    add_column :acts, :address, :string
  end
end
