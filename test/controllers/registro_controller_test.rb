require 'test_helper'

class RegistroControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get registro_new_url
    assert_response :success
  end

  test "should get create" do
    get registro_create_url
    assert_response :success
  end

end
