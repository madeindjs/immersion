# Preview all emails at http://localhost:3000/rails/mailers/reservation_mailer
class ReservationMailerPreview < ActionMailer::Preview

  def accept_reservation
    product = Product.new id: 1, name: "Repas polonais"
    product.user = User.all.last

    reservation = Reservation.new
    reservation.user = User.all.first
    reservation.product = product

    ReservationMailer.accept_reservation reservation
  end

end
