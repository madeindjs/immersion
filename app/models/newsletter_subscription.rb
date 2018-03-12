class NewsletterSubscription < ApplicationRecord
  before_create :generate_unsubscribe_link

  has_many :newsletter_histories
  def unsubscribe
    self.deleted_at = DateTime.now
    self.save
  end

  private

  def generate_unsubscribe_link
    return self.unsubscribe_link = Digest::SHA1.hexdigest("#{id}#{email}#{created_at}")
  end
end
