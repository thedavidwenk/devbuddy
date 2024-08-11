require "test_helper"

class DeviseAuthTest < ActionDispatch::IntegrationTest
  test "a user needs to login to access the account overview" do
    get account_overview_user_path(users(:one))
    assert_response :redirect
    assert_redirected_to new_user_session_path

    user = users(:one)
    sign_in user
    get account_overview_user_path(users(:one))
    assert_response :success
  end
end
