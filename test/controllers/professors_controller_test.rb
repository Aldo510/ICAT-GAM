require "test_helper"

class ProfessorsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get professors_show_url
    assert_response :success
  end
end
