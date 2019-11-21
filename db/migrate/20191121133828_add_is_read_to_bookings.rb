class AddIsReadToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :is_read, :boolean, default: false
  end
end
