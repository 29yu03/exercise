require "test_helper"

class Public::TopicsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_topics_index_url
    assert_response :success
  end
end
