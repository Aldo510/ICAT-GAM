require "test_helper"

class WarehousesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get warehouses_index_url
    assert_response :success
  end

  test "should get show" do
    get warehouses_show_url
    assert_response :success
  end
end
