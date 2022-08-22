class AddRatingsToPlants < ActiveRecord::Migration[7.0]
  def change
    add_column :plants, :ratings, :integer, array: true, default: []
  end
end
