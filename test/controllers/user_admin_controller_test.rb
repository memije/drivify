require 'test_helper'

class UserAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_admin_index_url
    assert_response :success
  end

  test "should get new" do
    get user_admin_new_url
    assert_response :success
  end

  test "should get create" do
    get user_admin_create_url
    assert_response :success
  end

  test "should get destroy" do
    get user_admin_destroy_url
    assert_response :success
  end

end
