module RecyclingCentersHelper
  def get_all_factions
    Sign.group(:faction_number).order(:faction_number).pluck(:faction_number)
  end
end
