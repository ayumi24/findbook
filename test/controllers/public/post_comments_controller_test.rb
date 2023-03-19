require "test_helper"

class Public::PostCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_post_comments_new_url
    assert_response :success
  end

  test "should get create" do
    get public_post_comments_create_url
    assert_response :success
  end

  test "should get show" do
    get public_post_comments_show_url
    assert_response :success
  end

  test "should get destroy" do
    get public_post_comments_destroy_url
    assert_response :success
  end
end
