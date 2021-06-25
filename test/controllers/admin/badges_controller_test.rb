require "test_helper"

class Admin::BadgesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_badges_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_badges_show_url
    assert_response :success
  end
end
