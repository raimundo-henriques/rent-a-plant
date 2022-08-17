class CreatePlants < ActiveRecord::Migration[7.0]
  def change
    create_table :plants do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :temp_min
      t.integer :temp_max
      t.string :ideal_light
      t.string :tolerated_light
      t.string :common_name
      t.string :latin_name
      t.string :family
      t.integer :difficulty_level
      t.float :avg_rating

      t.timestamps
    end
  end
end
