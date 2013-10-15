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
  end
end
