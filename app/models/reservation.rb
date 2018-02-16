class Reservation < ApplicationRecord
  has_many :reservation_statuses
  belongs_to :product
  belongs_to :user

  after_create :create_initial_status


  private

  def create_initial_status
    status = ReservationStatus.new reservation_id: self.id
    status.requested!
    status.save
  end
end
