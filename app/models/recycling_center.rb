class RecyclingCenter < ActiveRecord::Base
  serialize :factions

  validates_presence_of :name, :address, :category
  # latitude: float, longitude: float
end
