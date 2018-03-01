class ReservationMailer < ApplicationMailer


  def accept_reservation reservation
    @reservation = reservation
    mail(to: @reservation.product.user.email, subject: 'Bienvenue sur Immersion, confirmez votre email dès à présent')
  end

end
