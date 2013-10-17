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
        assigns(:last_sign_updated).should == @sign.updated_at.to_i
      end

      context 'with only' do
        it 'gets some' do
          get :index, only: @sign.category
          assigns(:signs).should == [@sign]
        end

        it 'gets none' do
          get :index, only: 'Blob'
          assigns(:signs).should == []
        end
      end
    end

    describe '#new' do
      it 'should assign sign' do
        get :new
        assigns(:sign).should be_new_record
      end
    end

    describe '#create' do
      context 'valid params' do
        it 'creates' do
          sign = FactoryGirl.build(:sign)
          post :create, sign: sign.attributes.except(:category).merge(categories: ['Blå'])
          Sign.count.should == 1
        end

        it 'creates more than one' do
          sign = FactoryGirl.build(:sign)
          post :create, sign: sign.attributes.except(:category).merge(categories: ['Blå', 'Grå'])
          Sign.count.should == 2
        end
      end

      context 'invalid params' do
        it 'renders new' do
          post :create, sign: { invalid: '' }
          response.should render_template(:new)
        end
      end
    end

    describe '#update' do
      context 'valid params' do
        before do
          @sign1 = FactoryGirl.create(:sign, name: 'Skilt',     faction_number: 1,                     category: 'Blå')
          @sign2 = FactoryGirl.create(:sign, name: @sign1.name, faction_number: @sign1.faction_number, category: 'Grå')
        end

        it 'updates' do
          patch :update, id: @sign1.id, sign: { name: 'Nyt skilt' }
          @sign1.reload.name.should == 'Nyt skilt'
        end

        it 'updates more than one' do
          @sign1.name.should == @sign2.name
          patch :update, id: @sign1.id, sign: { name: 'Nyt skilt', categories: [@sign1.category, @sign2.category] }
          @sign1.reload.name.should == 'Nyt skilt'
          @sign2.reload.name.should == 'Nyt skilt'
        end

        it 'updates and creates' do
          patch :update, id: @sign1.id, sign: { name: 'Nyt skilt', categories: [@sign1.category, 'Farvede'] }
          Sign.count.should == 3
        end
      end

      context 'invalid params' do
        it 'renders edit' do
          @sign = FactoryGirl.create(:sign)

          patch :update, id: @sign.id, sign: { categories: nil }

          @sign.reload.category.should_not be_nil
          response.should_not be_redirect
          response.should render_template(:edit)
        end
      end
    end

    describe '#destroy' do
      it 'should delete sign' do
        @sign = FactoryGirl.create(:sign)
        delete :destroy, id: @sign.id
        Sign.count.should == 0
      end
    end

    describe '#edit' do
      it 'should get all signs with same name' do
        sign1 = FactoryGirl.create(:sign, name: 'Sign')
        sign2 = FactoryGirl.create(:sign, name: 'Sign', category: 'Grå')

        get :edit, id: sign1.id
        assigns(:all_categories_for_sign).should include(sign1.category)
        assigns(:all_categories_for_sign).should include(sign2.category)
      end
    end
  end
end
