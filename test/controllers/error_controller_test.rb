require 'test_helper'

class ErrorControllerTest < ActionDispatch::IntegrationTest
  test "should get error404" do
    get error_error404_url
    assert_response :success
  end

  test "should get ie" do
    get error_ie_url
    assert_response :success
  end

end
