require 'test_helper'

class QuestionAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get question_admin_index_url
    assert_response :success
  end

  test "should get new" do
    get question_admin_new_url
    assert_response :success
  end

  test "should get create" do
    get question_admin_create_url
    assert_response :success
  end

  test "should get edit" do
    get question_admin_edit_url
    assert_response :success
  end

  test "should get update" do
    get question_admin_update_url
    assert_response :success
  end

  test "should get destroy" do
    get question_admin_destroy_url
    assert_response :success
  end

end
