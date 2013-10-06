require 'test_helper'

class RecyclingCentersControllerTest < ActionController::TestCase
  setup do
    @recycling_center = recycling_centers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recycling_centers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recycling_center" do
    assert_difference('RecyclingCenter.count') do
      post :create, recycling_center: { address: @recycling_center.address, category: @recycling_center.category, factions: @recycling_center.factions, latitude: @recycling_center.latitude, longitude: @recycling_center.longitude, name: @recycling_center.name }
    end

    assert_redirected_to recycling_center_path(assigns(:recycling_center))
  end

  test "should show recycling_center" do
    get :show, id: @recycling_center
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recycling_center
    assert_response :success
  end

  test "should update recycling_center" do
    patch :update, id: @recycling_center, recycling_center: { address: @recycling_center.address, category: @recycling_center.category, factions: @recycling_center.factions, latitude: @recycling_center.latitude, longitude: @recycling_center.longitude, name: @recycling_center.name }
    assert_redirected_to recycling_center_path(assigns(:recycling_center))
  end

  test "should destroy recycling_center" do
    assert_difference('RecyclingCenter.count', -1) do
      delete :destroy, id: @recycling_center
    end

    assert_redirected_to recycling_centers_path
  end
end
