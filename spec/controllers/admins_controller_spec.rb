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
        assigns(:admins).should eq([@admin])
        assigns(:last_admin_updated).should eq(@admin.updated_at.to_i)
      end
    end

    describe 'PATCH/PUT #update' do
      it 'redirects to users_path' do
        patch :update, id: @admin.id, admin: { email: @admin.email, password: 'new_secret', password_confirmation: 'new_secret' }
        response.should be_redirect
        response.should redirect_to(users_path)
      end

      context 'with password blank' do
        it 'doesnt change password' do
          new_email = 'some@email2.com'
          password = @admin.password

          patch :update, id: @admin.id, admin: { email: new_email }

          response.should be_redirect
          response.should redirect_to(users_path)

          @admin.reload
          @admin.email.should eq(new_email)
          @admin.password.should eq(password)
        end
      end

      context 'invalid params' do
        it 'renders edit' do
          patch :update, id: @admin.id, admin: { email: 'not_an_email' }
          response.should_not be_redirect
          response.should render_template(:edit)
        end
      end
    end

    describe 'GET #new' do
      it 'renders' do
        get :new
        response.should be_success
      end
    end

    describe 'POST #create' do
      context 'valid params' do
        it 'should create new admin' do
          post :create, admin: { email: 'some@email.com', password: 'secret', password_confirmation: 'secret' }
          Admin.count.should eq(2) # The one logged in and this new one
        end
      end

      context 'invalid params' do
        it 'renders new' do
          post :create, admin: { email: 'not_an_email' }
          response.should_not be_redirect
          response.should render_template(:new)
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'deletes the admin' do
        delete :destroy, id: @admin.id
        Admin.where(id: @admin.id).should be_empty
      end
    end
  end
end
