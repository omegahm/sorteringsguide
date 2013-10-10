class RecyclingCenter < ActiveRecord::Base
  serialize :factions
  before_validation :encode_location

  validates_presence_of :name, :address, :category, :lat, :lng

  def encode_location
    location = Geokit::Geocoders::GoogleGeocoder3.geocode("#{self.address}, Denmark")
    self.lat = location.lat
    self.lng = location.lng
  end
end
