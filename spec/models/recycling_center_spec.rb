require 'spec_helper'

describe RecyclingCenter do
  context 'before_*' do
    it 'calls encode_location before validation' do
      rc = FactoryGirl.build(:recycling_center)
      rc.should_receive(:encode_location)
      rc.save
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

