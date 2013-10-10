class ChangeLatitudeAndLongitudeToLatAndLngOnRecyclingCenters < ActiveRecord::Migration
  def change
    rename_column :recycling_centers, :latitude, :lat
    rename_column :recycling_centers, :longitude, :lng
  end
end
