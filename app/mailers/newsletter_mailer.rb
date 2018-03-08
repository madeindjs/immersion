class NewsletterMailer < ApplicationMailer

  def presentation newsletter
    @newsletter = newsletter
    mail to: @newsletter.email, subject: 'Immersion'
  end

end
