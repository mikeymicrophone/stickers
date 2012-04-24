require 'test_helper'

class TieringsControllerTest < ActionController::TestCase
  setup do
    @tiering = tierings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tierings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tiering" do
    assert_difference('Tiering.count') do
      post :create, tiering: @tiering.attributes
    end

    assert_redirected_to tiering_path(assigns(:tiering))
  end

  test "should show tiering" do
    get :show, id: @tiering
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tiering
    assert_response :success
  end

  test "should update tiering" do
    put :update, id: @tiering, tiering: @tiering.attributes
    assert_redirected_to tiering_path(assigns(:tiering))
  end

  test "should destroy tiering" do
    assert_difference('Tiering.count', -1) do
      delete :destroy, id: @tiering
    end

    assert_redirected_to tierings_path
  end
end
