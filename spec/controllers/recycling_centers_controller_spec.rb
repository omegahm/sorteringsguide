require 'spec_helper'

describe RecyclingCentersController do
  before(:each) do
    Rails.cache.clear
  end

  context 'with no admin logged in' do
    it 'redirects index' do
      get :index
      response.should be_redirect
    end

    it 'renders show' do
      rc = FactoryGirl.create(:recycling_center)
      get :show, id: rc.id
      response.should be_success
    end

    describe '#show' do
      it 'assigns' do
        rc = FactoryGirl.create(:recycling_center)
        get :show, id: rc.id

        assigns(:factions).should be_present
        assigns(:factions).should == rc.factions
        assigns(:last_sign_updated).should be_present
        assigns(:last_sign_updated).should == rc.updated_at.to_i
        assigns(:signs).should be_present
      end
    end
  end

  context 'with admin logged in' do
    before do
      @admin = FactoryGirl.create(:admin)
      sign_in @admin
    end

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

    describe '#new' do
      it 'renders' do
        get :new
        response.should be_success
      end
    end

    describe '#create' do
      context 'valid params' do
        it 'creates' do
          rc = FactoryGirl.build(:recycling_center)
          post :create, recycling_center: rc.attributes
          RecyclingCenter.count.should == 1
        end
      end

      context 'invalid params' do
        it 'renders new' do
          post :create, recycling_center: { invalid: '' }
          response.should render_template(:new)
        end
      end
    end

    context 'with recycling_center' do
      describe '#destroy' do
        it 'deletes the recycling center' do
          delete :destroy, id: FactoryGirl.create(:recycling_center).id
          RecyclingCenter.count.should == 0
        end
      end

      describe '#update' do
        before do
          @rc = FactoryGirl.create(:recycling_center)
        end

        it 'valid params' do
          patch :update, id: @rc.id, recycling_center: { name: 'Nyt sted' }
          @rc.reload.name.should == 'Nyt sted'
        end

        it 'invalid params' do
          patch :update, id: @rc.id, recycling_center: { address: nil }

          @rc.reload.address.should_not be_nil
          response.should_not be_redirect
          response.should render_template(:edit)
        end
      end
    end
  end
end
