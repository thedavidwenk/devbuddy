require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success
  end

  test "user should login before making a booking" do
    post user_bookings_path(users(:one))
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end
end
