class User < ApplicationRecord
  acts_as_authentic

  has_many :products
  has_many :reservations

  include Authlogic::ActsAsAuthentic::EmailToken::Confirmation

  validates_uniqueness_of :email

  mount_uploader :picture, PictureUploader

  extend FriendlyId
  friendly_id :firstname, use: :slugged

  acts_as_authentic do |c|
    c.crypto_provider = Authlogic::CryptoProviders::Sha512
  end


  def complete_name
    "#{self.lastname} #{self.firstname}"
  end

  def picture
    "http://lorempicsum.com/futurama/100/100/#{self.id}"
  end


  # def paypal_url(return_path)
  #   values = {
  #     business: "merchant@gotealeaf.com",
  #     cmd: "_xclick",
  #     upload: 1,
  #     return: "#{Rails.application.secrets.app_host}#{return_path}",
  #     invoice: id,
  #     amount: course.price,
  #     item_name: course.name,
  #     item_number: course.id,
  #     quantity: '1'
  #   }
  #   "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  # end

  def is_admin?
    false
  end

  # activate account from user email token
  #
  # Method imported from Authlogic::ActsAsAuthentic::EmailToken
  def activate
    self.activated = true
  end

  # def deliver_password_reset_instructions!
  #   reset_perishable_token!
  #   UserMailer.password_reset(self).deliver_now
  # end

  # Format to json_ld
  # @return [Hash]
  def to_jsonld
    url = Rails.application.routes.url_helpers.user_url self.id, host: 'votre.restaurant'
    {
      "@context" => "http://schema.org/",
      "@type": "Person",
      givenName: self.lastname,
      url: url
    }
  end

end
