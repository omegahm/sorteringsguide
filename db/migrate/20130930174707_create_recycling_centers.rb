class CreateRecyclingCenters < ActiveRecord::Migration
  def change
    create_table :recycling_centers do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :category
      t.text :factions

      t.timestamps
    end
  end
end
