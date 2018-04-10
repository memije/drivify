require 'test_helper'

class QuizEvalControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get quiz_eval_index_url
    assert_response :success
  end

end
