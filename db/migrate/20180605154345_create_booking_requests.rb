class CreateBookingRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :booking_requests do |t|
      t.string :name, null: false
      t.string :email
      t.date :event_date, null: false
      t.integer :budget
      t.string :company, null: false
      t.string :phone, null: false
      t.string :event_location, null: false
      t.text :comments
      t.integer :status, default: 0
      t.references :service, foreign_key: true
      t.references :celebrity, foreign_key: true

      t.timestamps
    end
  end
end
