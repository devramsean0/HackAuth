require "test_helper"

class User::ProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get user_profile_edit_url
    assert_response :success
  end
end
