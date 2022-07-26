require "test_helper"

class CertifiedsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get certifieds_index_url
    assert_response :success
  end

  test "should get show" do
    get certifieds_show_url
    assert_response :success
  end
end
