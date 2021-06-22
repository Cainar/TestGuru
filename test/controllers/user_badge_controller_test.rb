require "test_helper"

class UserBadgeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_badge_index_url
    assert_response :success
  end
end
