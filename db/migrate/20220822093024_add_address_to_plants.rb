class AddAddressToPlants < ActiveRecord::Migration[7.0]
  def change
    add_column :plants, :address, :string
  end
end
