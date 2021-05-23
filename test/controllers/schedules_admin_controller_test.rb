require 'test_helper'

class SchedulesAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get schedules_admin_index_url
    assert_response :success
  end

end
