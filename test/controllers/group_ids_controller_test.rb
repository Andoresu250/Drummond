require 'test_helper'

class GroupIdsControllerTest < ActionController::TestCase
  setup do
    @group_id = group_ids(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_ids)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_id" do
    assert_difference('GroupId.count') do
      post :create, group_id: { name: @group_id.name }
    end

    assert_redirected_to group_id_path(assigns(:group_id))
  end

  test "should show group_id" do
    get :show, id: @group_id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @group_id
    assert_response :success
  end

  test "should update group_id" do
    patch :update, id: @group_id, group_id: { name: @group_id.name }
    assert_redirected_to group_id_path(assigns(:group_id))
  end

  test "should destroy group_id" do
    assert_difference('GroupId.count', -1) do
      delete :destroy, id: @group_id
    end

    assert_redirected_to group_ids_path
  end
end
