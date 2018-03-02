class ReservationMailer < ApplicationMailer


  def accept_reservation reservation
    @reservation = reservation
    mail(to: @reservation.product.user.email, subject: 'Nouvelle réservation pour %s' % @reservation.product.name)
  end

  def new_message message_to_sent
    @message = message_to_sent
    @product = @message.reservation.product
    mail(to: @product.user.email, subject: 'Nouveau message de %s concernant %s' % [
      @product.name,
      @message.user.complete_name,
    ])
  end

end
