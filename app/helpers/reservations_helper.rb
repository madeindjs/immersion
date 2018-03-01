module ReservationsHelper

  def status_badge reservation
    current_status = reservation.current_status
    ('<span class="badge badge-%s">%s</span>' % [
       current_status.color,
       t("reservation_status.#{current_status.status}")
    ]).html_safe if current_status
  end

end
