require 'test_helper'

class AnswerAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get answer_admin_index_url
    assert_response :success
  end

  test "should get new" do
    get answer_admin_new_url
    assert_response :success
  end

  test "should get create" do
    get answer_admin_create_url
    assert_response :success
  end

  test "should get edit" do
    get answer_admin_edit_url
    assert_response :success
  end

  test "should get update" do
    get answer_admin_update_url
    assert_response :success
  end

  test "should get destroy" do
    get answer_admin_destroy_url
    assert_response :success
  end

end
