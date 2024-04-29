require "test_helper"

class LuluControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get lulu_show_url
    assert_response :success
  end
end
