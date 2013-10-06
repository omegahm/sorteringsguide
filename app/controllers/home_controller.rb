class HomeController < ApplicationController
  def index
    @recycling_centers = RecyclingCenter.all
  end

  def send_suggestion_mail
    Admin.wants_mail.each do |admin|
      Notifier.send_suggestion_mail(admin, params).deliver
    end

    render nothing: true
  end
end
