class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.boolean :status
      t.references :user, null: false, foreign_key: true
      t.references :listing, null: false, foreign_key: true
      # t.integer :starts_date
      # t.integer :end_date

      t.timestamps
    end
  end
end
