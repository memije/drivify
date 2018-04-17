require 'test_helper'

class SimulationEvalControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get simulation_eval_index_url
    assert_response :success
  end

end
