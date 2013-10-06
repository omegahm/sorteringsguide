class Sign < ActiveRecord::Base
  SIGN_CATEGORIES = ["Blå", "Grå"]

  has_attached_file :image,
                    :styles => {
                      :medium => "300x300>",
                      :thumb => "100x100>"
                    },
                    :default_url => "/images/:style/missing.png"

  validates_presence_of :name,
                        :faction_number,
                        :search_terms,
                        :category,
                        :image


end
