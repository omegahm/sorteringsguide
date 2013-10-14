require 'spec_helper'

describe Admin do
  context 'scopes' do
    describe ':wants_mail' do
      it 'finds people who want mail' do
        admin1 = FactoryGirl.create(:admin)
        admin2 = FactoryGirl.create(:admin, mails: false)

        Admin.wants_mail.should include(admin1)
        Admin.wants_mail.should_not include(admin2)
      end
    end
  end
end

# == Schema Information
#
# Table name: admins
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  mails                  :boolean          default(FALSE)
#

