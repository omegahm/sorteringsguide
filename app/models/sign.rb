class Sign < ActiveRecord::Base
  SIGN_CATEGORIES = ["Blå", "Grå", "Farvede"]

  has_attached_file :image,
                    styles: {
                      medium: "300x300>",
                      thumb: "100x100>"
                    }

  validates_presence_of :name, :category
  validates_uniqueness_of :name, scope: :category

  scope :for_factions, ->(faction_numbers, category) { where(faction_number: faction_numbers, category: category) }
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

