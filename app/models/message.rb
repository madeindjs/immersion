class Message < ApplicationRecord
  belongs_to :user
  belongs_to :reservation


  # Send message to the reservation author or product author
  #
  # @return User
  def to
    if self.reservation.user_id == self.user_id
      # client send a message to the author
      return self.reservation.product.user
    end
      return self.reservation.user
    else
  end
end
