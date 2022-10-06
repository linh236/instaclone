require "test_helper"

class PowerpointControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get powerpoint_create_url
    assert_response :success
  end
end
