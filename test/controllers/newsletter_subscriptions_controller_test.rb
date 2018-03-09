require 'test_helper'

class NewslettersSubscriptionControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subscription = newsletter_subscriptions(:one)
  end

  test "should create newsletter" do
    assert_difference('NewsletterSubscription.count') do
      post newsletter_subscriptions_url, params: { newsletter_subscription: { email: @subscription.email } }
    end

    assert_redirected_to home_url
  end

  test "should unsubscribe newsletter" do
    get unsubscribe_url(hash: @subscription.unsubscribe_link)
    @subscription.reload

    assert_redirected_to home_url
    assert_not_nil @subscription.deleted_at
  end
end
