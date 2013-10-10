module RecyclingCentersHelper
  def get_all_factions
    Sign.group(:faction_number).where.not(faction_number: nil).order("CAST(faction_number AS INTEGER)").pluck(:faction_number)
  end
end
