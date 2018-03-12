require 'test_helper'

class NewsletterSubscriptionTest < ActiveSupport::TestCase
  test "should generate unsubscribe link" do
    subscription = NewsletterSubscription.create email: 'test@test.fr'
    assert_not_nil subscription.unsubscribe_link
  end

  test "should create deleted_at" do
    subscription = newsletter_subscriptions(:one)
    subscription.unsubscribe

    assert_equal subscription.deleted_at.to_date, DateTime.now.to_date
  end

end
