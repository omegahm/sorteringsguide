class Admin < ActiveRecord::Base
  if Rails.env.production?
    devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  else
    devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable
  end

  scope :wants_mail, ->{ where("mails = 't'") }
end
