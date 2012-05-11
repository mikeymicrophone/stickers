require 'test_helper'

class TierHousesControllerTest < ActionController::TestCase
  setup do
    @tier_house = tier_houses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tier_houses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tier_house" do
    assert_difference('TierHouse.count') do
      post :create, tier_house: {  }
    end

    assert_redirected_to tier_house_path(assigns(:tier_house))
  end

  test "should show tier_house" do
    get :show, id: @tier_house
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tier_house
    assert_response :success
  end

  test "should update tier_house" do
    put :update, id: @tier_house, tier_house: {  }
    assert_redirected_to tier_house_path(assigns(:tier_house))
  end

  test "should destroy tier_house" do
    assert_difference('TierHouse.count', -1) do
      delete :destroy, id: @tier_house
    end

    assert_redirected_to tier_houses_path
  end
end
