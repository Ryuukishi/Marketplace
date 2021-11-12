class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :address_line1
      t.string :address_line2
      t.string :suburb
      t.string :state
      t.integer :postcode
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
