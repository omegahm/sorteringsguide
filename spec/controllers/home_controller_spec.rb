require 'spec_helper'

describe HomeController do
  describe '#index' do
    before do
      @rc = FactoryGirl.create(:recycling_center)
    end

    it 'renders' do
      get :index
      response.should be_success
    end

    it 'assigns' do
      get :index
      assigns(:last_recycling_center_updated).should == @rc.updated_at.to_i
      assigns(:recycling_centers).should == [@rc]
    end
  end

  describe '#send_suggestion_mail' do
    it 'sends to the correct mails' do
      FactoryGirl.create(:admin)
      FactoryGirl.create(:admin, mails: false)

      put :send_suggestion_mail, { name: 'some', email: 'that', suggestion: 'yup' }
      response.should be_success
      ActionMailer::Base.deliveries.should_not be_empty
      ActionMailer::Base.deliveries.count.should == 1
    end
  end
end
