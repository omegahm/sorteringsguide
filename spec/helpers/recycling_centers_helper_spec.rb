require 'spec_helper'

describe RecyclingCentersHelper do
  describe '#get_all_factions' do
    it 'gets all faction numbers' do
      sign1 = FactoryGirl.create(:sign, faction_number: 1)
      sign2 = FactoryGirl.create(:sign, faction_number: '2')
      sign3 = FactoryGirl.create(:sign, faction_number: '1-1')
      helper.get_all_factions.should == [sign1.faction_number, sign3.faction_number, sign2.faction_number].map(&:to_s)
    end
  end
end
