require 'test_helper'

class EndeavorsControllerTest < ActionController::TestCase
  setup do
    @endeavor = endeavors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:endeavors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create endeavor" do
    assert_difference('Endeavor.count') do
      post :create, endeavor: @endeavor.attributes
    end

    assert_redirected_to endeavor_path(assigns(:endeavor))
  end

  test "should show endeavor" do
    get :show, id: @endeavor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @endeavor
    assert_response :success
  end

  test "should update endeavor" do
    put :update, id: @endeavor, endeavor: @endeavor.attributes
    assert_redirected_to endeavor_path(assigns(:endeavor))
  end

  test "should destroy endeavor" do
    assert_difference('Endeavor.count', -1) do
      delete :destroy, id: @endeavor
    end

    assert_redirected_to endeavors_path
  end
end
