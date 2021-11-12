class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :brand
      t.string :model
      t.string :body_type
      t.integer :door_count
      t.integer :seat_count
      t.string :transmission
      t.string :number_plate
      t.boolean :available
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
