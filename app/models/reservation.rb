class Reservation < ApplicationRecord
  has_many :statuses
  belongs_to :product
  belongs_to :user
end
