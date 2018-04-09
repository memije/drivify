require 'test_helper'

class QuizTypeAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get quiz_type_admin_index_url
    assert_response :success
  end

  test "should get new" do
    get quiz_type_admin_new_url
    assert_response :success
  end

  test "should get create" do
    get quiz_type_admin_create_url
    assert_response :success
  end

  test "should get edit" do
    get quiz_type_admin_edit_url
    assert_response :success
  end

  test "should get update" do
    get quiz_type_admin_update_url
    assert_response :success
  end

  test "should get destroy" do
    get quiz_type_admin_destroy_url
    assert_response :success
  end

end
