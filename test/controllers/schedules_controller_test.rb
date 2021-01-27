require 'test_helper'

class SchedulesControllerTest < ActionDispatch::IntegrationTest
  test "should get enter_time" do
    get schedules_enter_time_url
    assert_response :success
  end

  test "should get end_time" do
    get schedules_end_time_url
    assert_response :success
  end

end
