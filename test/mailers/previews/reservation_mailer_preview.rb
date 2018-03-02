# Preview all emails at http://localhost:3000/rails/mailers/reservation_mailer
class ReservationMailerPreview < ActionMailer::Preview

  def accept_reservation
    product = Product.new id: 1, name: "Repas polonais"
    product.user = User.all.last

    reservation = Reservation.new
    reservation.user = User.first
    reservation.product = product

    ReservationMailer.accept_reservation reservation
  end

  def new_message
    message = Message.new
    message.reservation = Reservation.first
    message.user = User.first
    message.content = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'

    ReservationMailer.new_message message
  end

end
