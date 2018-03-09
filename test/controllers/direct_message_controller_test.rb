require 'test_helper'

class DirectMessageControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get direct_message_create_url
    assert_response :success
  end

  test "should get index" do
    get direct_message_index_url
    assert_response :success
  end

end
