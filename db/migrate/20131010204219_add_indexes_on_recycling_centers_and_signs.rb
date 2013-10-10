class AddIndexesOnRecyclingCentersAndSigns < ActiveRecord::Migration
  def change
    add_index :recycling_centers, :name
    add_index :recycling_centers, :lat
    add_index :recycling_centers, :lng
    add_index :recycling_centers, :factions
    add_index :recycling_centers, :category

    add_index :signs, :name
    add_index :signs, :faction_number
    add_index :signs, :category
  end
end
