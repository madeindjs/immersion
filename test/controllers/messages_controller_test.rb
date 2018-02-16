require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message = messages(:one)
  end

  test "should recirect on get index" do
    get messages_url
    assert_redirected_to signin_url
  end

  test "should get index" do
    login(users(:me))
    get messages_url
    assert_response :success
  end

  test "should redirect on create message" do
    assert_no_difference('Message.count') do
      post messages_url, params: { message: { content: @message.content, reservation_id: 1 } }
    end

    assert_redirected_to signin_url
  end

  test "should create message" do
    login(users(:me))
    assert_difference('Message.count') do
      post messages_url, params: { message: { content: @message.content, reservation_id: 1 } }
    end

    assert_redirected_to message_url(Message.last)
  end

end
