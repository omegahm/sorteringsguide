class HomeController < ApplicationController
  def index
    @recycling_centers = cached_recycling_centers
  end

  def send_suggestion_mail
    Admin.wants_mail.each do |admin|
      Notifier.send_suggestion_mail(admin, params).deliver
    end

    render nothing: true
  end
end
