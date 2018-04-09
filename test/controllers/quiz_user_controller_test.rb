require 'test_helper'

class QuizUserControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get quiz_user_index_url
    assert_response :success
  end

end
