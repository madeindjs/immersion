require 'test_helper'

class NewsletterTest < ActiveSupport::TestCase
  test "should generate unsubscribe link" do
    newsletter = Newsletter.create email: 'test@test.fr'
    assert_not_nil newsletter.unsubscribe_link
  end

  test "should create deleted_at" do
    newsletter = newsletters(:one)
    newsletter.unsubscribe

    assert_equal newsletter.deleted_at.to_date, DateTime.now.to_date
  end

  test "should send email & add it to history" do
    newsletter = newsletters(:one)
    assert_difference('NewsletterHistory.count') do
      newsletter.send_mail('presentation')
    end
  end
end
