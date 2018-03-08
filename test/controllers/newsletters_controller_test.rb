require 'test_helper'

class NewslettersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @newsletter = newsletters(:one)
  end

  test "should create newsletter" do
    assert_difference('Newsletter.count') do
      post newsletters_url, params: { newsletter: { email: @newsletter.email } }
    end

    assert_redirected_to home_url
  end

  test "should unsubscribe newsletter" do
    get unsubscribe_url(hash: @newsletter.unsubscribe_link)
    @newsletter.reload

    assert_redirected_to home_url
    assert_not_nil @newsletter.deleted_at
  end
end
