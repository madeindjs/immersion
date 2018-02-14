class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category

  extend FriendlyId
  friendly_id :name, use: :slugged
end
