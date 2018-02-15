require 'test_helper'

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reservation = reservations(:one)
  end

  test "should redirect on get index" do
    get reservations_url
    assert_redirected_to signin_url
  end

  test "should get index" do
    login(users(:me))
    get reservations_url
    assert_response :success
  end

  test "should redirect on get new" do
    get new_reservation_url(1)
    assert_redirected_to signin_url
  end

  test "should get new" do
    login(users(:me))
    get new_reservation_url(1)
    assert_response :success
  end

  test "should create reservation" do
    login(users(:me))
    assert_difference('Reservation.count') do
      post reservations_url, params: { reservation: { product_id: @reservation.product_id, start_on: @reservation.start_on } }
    end

    assert_redirected_to reservation_url(Reservation.last)
  end

  test "should redirect create reservation" do
    assert_no_difference('Reservation.count') do
      post reservations_url, params: { reservation: { product_id: @reservation.product_id, start_on: @reservation.start_on } }
    end

    assert_redirected_to signin_url
  end

  test "should redirect on show reservation" do
    get reservation_url(@reservation)
    assert_redirected_to signin_url
  end

  test "should show reservation" do
    login(users(:me))
    get reservation_url(@reservation)
    assert_response :success
  end

  test "should redirect on destroy reservation" do
    assert_no_difference('Reservation.count') do
      delete reservation_url(@reservation)
    end

    assert_redirected_to signin_url
  end

  test "should destroy reservation" do
    login(users(:me))
    assert_difference('Reservation.count', -1) do
      delete reservation_url(@reservation)
    end

    assert_redirected_to reservations_url
  end
end
