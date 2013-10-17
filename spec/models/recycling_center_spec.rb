require 'spec_helper'

describe RecyclingCenter do
  context 'before_validation' do
    it 'calls encode_location before validation' do
      rc = FactoryGirl.build(:recycling_center, lat: nil, lng: nil)

      rc.should_receive(:encode_location)
      rc.save
    end

    it 'reencodes lat and lng if address is changed' do
      rc = FactoryGirl.create(:recycling_center)
      lat, lng = rc.lat, rc.lng

      rc.address = 'Glostrup genbrugsplads, 2600 Glostrup'
      rc.save

      rc.lat.should_not == lat
      rc.lng.should_not == lng
    end
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

