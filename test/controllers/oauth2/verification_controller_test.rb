require "test_helper"

class Oauth2::VerificationControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get oauth2_verification_edit_url
    assert_response :success
  end
end
