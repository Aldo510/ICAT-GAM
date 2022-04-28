require "test_helper"

class DataSheetsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get data_sheets_show_url
    assert_response :success
  end
end
