require 'test_helper'

class NewslettersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @newsletter = newsletters(:one)
  end

  test "should get new" do
    get new_newsletter_url
    assert_response :success
  end

  test "should create newsletter" do
    assert_difference('Newsletter.count') do
      post newsletters_url, params: { newsletter: { email: @newsletter.email } }
    end

    assert_redirected_to newsletter_url(Newsletter.last)
  end

  test "should destroy newsletter" do
    assert_difference('Newsletter.count', -1) do
      delete newsletter_url(@newsletter)
    end

    assert_redirected_to newsletters_url
  end
end
