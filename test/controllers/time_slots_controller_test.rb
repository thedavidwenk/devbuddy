require "test_helper"

class TimeSlotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @valid_time_slot_params = {
      start_time: "09:00",
      end_time: "10:00",
      date: "2024-08-11"
    }
  end

  test "should create time slot and redirect to account overview" do
    sign_in @user

    assert_difference('TimeSlot.count', 1) do
      post time_slots_path, params: @valid_time_slot_params
    end

    assert_redirected_to account_overview_user_path(@user)
    follow_redirect!
  end

  test "should not create time slot with invalid data" do
    sign_in @user

    assert_no_difference('TimeSlot.count') do
      post time_slots_path, params: { start_time: "09:00", end_time: "08:00", date: "2024-08-11" }
    end

    assert_response :unprocessable_entity
  end
end
