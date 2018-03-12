class NewsletterMailer < ApplicationMailer

  def newsletter newsletter, subscription
    @newsletter = newsletter
    @subscription = subscription
    mail to: @subscription.email, subject: @newsletter.object
  end

end
