class Newsletter < ApplicationRecord
  has_many :newsletter_histories

  def send_emails
    subscriber_ids = self.newsletter_histories.map{|h| h.newsletter_subscription.id }
    NewsletterSubscription.where.not(id: subscriber_ids).each do |subscription|
      NewsletterMailer.newsletter(self, subscription).deliver_now
      NewsletterHistory.create newsletter_id: self.id, newsletter_subscription_id: subscription.id
    end
  end
end
