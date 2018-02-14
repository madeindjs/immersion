class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category

  mount_uploader :picture, PictureUploader

  extend FriendlyId
  friendly_id :name, use: :slugged
end
