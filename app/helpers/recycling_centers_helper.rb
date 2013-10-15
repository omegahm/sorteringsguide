module RecyclingCentersHelper
  def get_all_factions
    Sign.group(:faction_number).where("faction_number IS NOT NULL AND faction_number != ''").order("CAST(faction_number AS INTEGER)").pluck(:faction_number)
  end
end
