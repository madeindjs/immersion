class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :product_id
      t.datetime :start_on, not_null: true

      t.timestamps
    end

    add_column :products, :duration, :integer

    create_table :reservation_status do |t|
      t.belongs_to :reservation, index: true
      t.integer :status, default: 0, not_null: true
      t.timestamps
    end

  end
end
