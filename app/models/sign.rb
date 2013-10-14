class Sign < ActiveRecord::Base
  SIGN_CATEGORIES = ["Blå", "Grå", "Farvede"]

  has_attached_file :image,
                    styles: {
                      medium: "300x300>",
                      thumb: "100x100>"
                    }

  validates_presence_of :name, :category

  scope :for_factions, ->(faction_numbers, category) { where(faction_number: faction_numbers, category: category) }
end
