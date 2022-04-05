require "test_helper"

class ShelvesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get shelves_show_url
    assert_response :success
  end
end
