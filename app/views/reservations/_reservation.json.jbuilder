json.extract! reservation, :id, :user_id, :product_id, :status, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
