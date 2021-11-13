class CreateBookingDates < ActiveRecord::Migration[6.1]
  def change
    create_table :booking_dates do |t|

      t.timestamps
    end
  end
end
