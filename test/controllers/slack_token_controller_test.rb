require 'test_helper'

class SlackTokenControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get slack_token_index_url
    assert_response :success
  end

  test "should get edit" do
    get slack_token_edit_url
    assert_response :success
  end

  test "should get save" do
    get slack_token_save_url
    assert_response :success
  end

end
