require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
  test "Should create status" do
    r = Reservation.create user_id: 1, product_id: 1, start_on: '2016-01-01 12:00:00'
    assert_same 1, r.statuses.size
  end
end
