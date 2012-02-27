require 'test_helper'

class InviteesControllerTest < ActionController::TestCase
  setup do
    @invitee = invitees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invitees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invitee" do
    assert_difference('Invitee.count') do
      post :create, invitee: @invitee.attributes
    end

    assert_redirected_to invitee_path(assigns(:invitee))
  end

  test "should show invitee" do
    get :show, id: @invitee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invitee
    assert_response :success
  end

  test "should update invitee" do
    put :update, id: @invitee, invitee: @invitee.attributes
    assert_redirected_to invitee_path(assigns(:invitee))
  end

  test "should destroy invitee" do
    assert_difference('Invitee.count', -1) do
      delete :destroy, id: @invitee
    end

    assert_redirected_to invitees_path
  end
end
