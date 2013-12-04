class RecyclingCenter < ActiveRecord::Base
  serialize :factions

  before_validation :encode_location, if: -> { lat.nil? || lng.nil? or (self.address_changed? && !self.new_record?) }

  validates_presence_of :name, :address, :category, :lat, :lng

  def encode_location
    location = Geokit::Geocoders::GoogleGeocoder3.geocode("#{address}, Denmark")
    self.lat = location.lat
    self.lng = location.lng
  end
end

# == Schema Information
#
# Table name: recycling_centers
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  address    :string(255)
#  lat        :float
#  lng        :float
#  category   :string(255)
#  factions   :text
#  created_at :datetime
#  updated_at :datetime
#
