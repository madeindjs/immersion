class ReservationStatus < ApplicationRecord
  enum status: {
    canceled: -1,
    requested: 0,# client sent request to the owner
    approved: 1,# owner accept the request
    paid: 2,# client paid the reservation
    archived: 3,#
  }

  belongs_to :reservation
end
