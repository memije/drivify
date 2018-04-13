require 'test_helper'

class SimulationUserControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get simulation_user_index_url
    assert_response :success
  end

  test "should get show" do
    get simulation_user_show_url
    assert_response :success
  end

  test "should get new" do
    get simulation_user_new_url
    assert_response :success
  end

  test "should get create" do
    get simulation_user_create_url
    assert_response :success
  end

  test "should get destroy" do
    get simulation_user_destroy_url
    assert_response :success
  end

end
