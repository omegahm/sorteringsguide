require 'spec_helper'

describe Sign do
  context "scopes" do
    describe ":for_factions" do
      it 'gets correct factions' do
        @valid_sign = FactoryGirl.create(:sign)
        @invalid_sign1 = FactoryGirl.create(:sign)
        @invalid_sign2 = FactoryGirl.create(:sign, faction_number: @valid_sign.faction_number, category: Sign::SIGN_CATEGORIES.last)

        Sign.for_factions(@valid_sign.faction_number, @valid_sign.category)
      end
    end
  end
end

# == Schema Information
#
# Table name: signs
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  faction_number     :string(255)
#  search_terms       :text
#  comment            :text
#  category           :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

