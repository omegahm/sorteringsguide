require 'spec_helper'

describe SignsController do
  context 'with no admin logged in' do
    it 'redirects index' do
      get :index
      response.should be_redirect
    end
  end

  context 'with admin logged in' do
    before do
      @admin = FactoryGirl.create(:admin)
      sign_in @admin
    end

    describe '#index' do
      before do
        @sign = FactoryGirl.create(:sign)
      end

      it 'renders' do
        get :index
        response.should be_success
      end

      it 'assigns' do
        get :index

        assigns(:signs).should == [@sign]
        assigns(:last_sign_updated).should == @sign.updated_at.iso8601
      end
    end
  end
end
