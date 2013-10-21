module RecyclingCentersHelper
  def get_all_factions
    Sign.group(:faction_number).where("faction_number IS NOT NULL AND faction_number != ''").pluck(:faction_number).sort_by(&:to_i)
  end
end
