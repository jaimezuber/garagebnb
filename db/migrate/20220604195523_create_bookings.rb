class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :client, null: false, foreign_key: { to_table: 'users' }
      t.references :garage, null: false, foreign_key: true
      t.string :status, default: "standby"
      t.date :initial_date
      t.date :end_date

      t.timestamps
    end
  end
end
