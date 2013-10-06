class Notifier < ActionMailer::Base
  default from: "info@sorteringsguide.dk"

  def send_suggestion_mail(admin, params)
    @admin = admin
    @params = params
    mail(to: @admin.email, subject: "Nyt forslag")
  end
end
