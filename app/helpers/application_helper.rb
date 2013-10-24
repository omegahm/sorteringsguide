module ApplicationHelper
  def cached_recycling_centers
    @last_recycling_center_updated ||= RecyclingCenter.order(updated_at: :desc).select(:updated_at).first.updated_at.to_i

    @recycling_centers ||= Rails.cache.fetch("c_recycling_center_#{@last_recycling_center_updated}") do
      RecyclingCenter.order(:name)
    end
  end

  def cached_signs
    @last_sign_updated ||= Sign.order(updated_at: :desc).select(:updated_at).first.updated_at.to_i

    @signs ||= Rails.cache.fetch("c_signs_#{@last_sign_updated}_#{@recycling_center.id}") do
      Sign.for_factions(@factions, @recycling_center.category).select("*, (search_terms || ', ' || name) AS search_terms").order(:name)
    end
  end
end
