require 'test_helper'

class SignsControllerTest < ActionController::TestCase
  setup do
    @sign = signs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:signs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sign" do
    assert_difference('Sign.count') do
      post :create, sign: { comment: @sign.comment, faction_number: @sign.faction_number, name: @sign.name, search_terms: @sign.search_terms, type: @sign.type }
    end

    assert_redirected_to sign_path(assigns(:sign))
  end

  test "should show sign" do
    get :show, id: @sign
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sign
    assert_response :success
  end

  test "should update sign" do
    patch :update, id: @sign, sign: { comment: @sign.comment, faction_number: @sign.faction_number, name: @sign.name, search_terms: @sign.search_terms, type: @sign.type }
    assert_redirected_to sign_path(assigns(:sign))
  end

  test "should destroy sign" do
    assert_difference('Sign.count', -1) do
      delete :destroy, id: @sign
    end

    assert_redirected_to signs_path
  end
end
