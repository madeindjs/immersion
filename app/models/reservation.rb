class Reservation < ApplicationRecord
  has_many :reservation_statuses
  has_many :messages
  belongs_to :product
  belongs_to :user

  after_create :create_initial_status

  validates_associated :user
  validates_associated :product
  validates :persons, presence: true
  validates :start_on, presence: true

  def current_status
    self.reservation_statuses.last
  end

  def total_price_without_charge
    self.product.price * self.persons
  end

  def price_of_service_charges
    total_price_without_charge * 0.1
  end

  def total_price
    total_price_without_charge + price_of_service_charges
  end


  private

  def create_initial_status
    status = ReservationStatus.new reservation_id: self.id
    status.requested!
    status.save
  end
end
