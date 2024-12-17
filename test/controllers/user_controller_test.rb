require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get additional_infomation" do
    get user_additional_infomation_url
    assert_response :success
  end
end
