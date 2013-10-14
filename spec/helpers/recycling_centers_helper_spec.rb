require 'spec_helper'

describe RecyclingCentersHelper do
  describe '#get_all_factions' do
    it 'gets all faction numbers' do
      sign1 = FactoryGirl.create(:sign)
      sign2 = FactoryGirl.create(:sign)
      helper.get_all_factions.should == [sign1.faction_number.to_s, sign2.faction_number.to_s]
    end
  end
end
