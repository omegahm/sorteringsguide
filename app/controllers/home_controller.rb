class HomeController < ApplicationController
  def index
    @last_recycling_center_updated = RecyclingCenter.order(updated_at: :desc).select(:updated_at).first.updated_at.to_i

    @recycling_centers = Rails.cache.fetch("c_recycling_center_#{@last_recycling_center_updated}") do
      RecyclingCenter.order(:name)
    end
  end

  def send_suggestion_mail
    Admin.wants_mail.each do |admin|
      Notifier.send_suggestion_mail(admin, params).deliver
    end

    render nothing: true
  end
end
