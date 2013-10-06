class AddMailsToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :mails, :boolean, default: false
  end
end
