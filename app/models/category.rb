class Category < ApplicationRecord
  has_many :products

  mount_uploader :picture, PictureUploader

  extend FriendlyId
  friendly_id :name, use: :slugged
end
