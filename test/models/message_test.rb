require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  setup do
    @me = users(:me)
    @my_girlfriend = users(:my_girlfriend)
    @reservation = reservations(:my_reservation_for_product_of_my_girlfriend)
  end

  test "send message to the product author" do
    message = Message.new reservation_id: @reservation.id, user_id: @me.id

    assert_equal @my_girlfriend.email, message.to.email
  end

  test "send message to the reservation author" do
    message = Message.new reservation_id: @reservation.id, user_id: @my_girlfriend.id

    assert_equal @me.email, message.to.email
  end

end
