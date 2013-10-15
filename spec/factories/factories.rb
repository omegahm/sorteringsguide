require 'factory_girl'

FactoryGirl.define do
  factory :admin do |admin|
    admin.sequence(:email) {|n| "mr#{n}@example.com"}
    admin.password 'secret'
    admin.password_confirmation 'secret'
    admin.mails true
  end

  factory :sign do |sign|
    sign.sequence(:name) {|n| "asfalt#{n}" }
    sign.sequence(:faction_number) {|n| n }
    sign.comment 'this is a comment'
    sign.category Sign::SIGN_CATEGORIES.first
    sign.search_terms 'asfalt jord møg'
  end

  factory :recycling_center do |rc|
    rc.name 'Gentofte'
    rc.address 'Ørnegårdsvej 15, 2820 Gentofte'
    rc.lat 55.7596095
    rc.lng 12.518301
    rc.category Sign::SIGN_CATEGORIES.first

    rc.after(:build) do |instance|
      if instance.factions.nil?
        sign = FactoryGirl.create(:sign, category: instance.category)
        instance.factions = sign.faction_number.to_s
      end
    end
  end
end
