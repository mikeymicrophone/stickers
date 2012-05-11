require 'test_helper'

class SubClubsControllerTest < ActionController::TestCase
  setup do
    @sub_club = sub_clubs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sub_clubs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sub_club" do
    assert_difference('SubClub.count') do
      post :create, sub_club: { description: @sub_club.description, name: @sub_club.name }
    end

    assert_redirected_to sub_club_path(assigns(:sub_club))
  end

  test "should show sub_club" do
    get :show, id: @sub_club
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sub_club
    assert_response :success
  end

  test "should update sub_club" do
    put :update, id: @sub_club, sub_club: { description: @sub_club.description, name: @sub_club.name }
    assert_redirected_to sub_club_path(assigns(:sub_club))
  end

  test "should destroy sub_club" do
    assert_difference('SubClub.count', -1) do
      delete :destroy, id: @sub_club
    end

    assert_redirected_to sub_clubs_path
  end
end
