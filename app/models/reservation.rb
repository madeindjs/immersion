class Reservation < ApplicationRecord
  has_many :status
  belongs_to :product
  belongs_to :user
end
