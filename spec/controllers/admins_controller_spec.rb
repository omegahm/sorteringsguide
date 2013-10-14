require 'spec_helper'

describe AdminsController do
  context 'with no admin logged in' do
    it 'redirects all methods' do
      get :index
      response.should be_redirect
    end
  end

  context 'with admin logged in' do
    before do
      @admin = FactoryGirl.create(:admin)
      sign_in @admin
    end

    describe 'GET #index' do
      it 'responds with success' do
        get :index
        response.should be_success
      end

      it 'assigns admins and last updated' do
        get :index
        assigns(:admins).should == [@admin]
        assigns(:last_admin_updated).should == @admin.updated_at.iso8601
      end
    end

    describe 'PATCH/PUT #update' do
      it 'redirects to users_path' do
        patch :update, id: @admin.id, admin: { email: @admin.email, password: 'new_secret', password_confirmation: 'new_secret' }
        response.should be_redirect
        response.should redirect_to(users_path)
      end
    end
  end
end
