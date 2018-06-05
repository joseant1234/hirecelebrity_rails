class CreateBookingTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :booking_topics do |t|
      t.string :title, null: false
      t.text :description
      t.boolean :popular, default: false
      t.attachment :photo
      t.string :image_url
      t.integer :status, default: 0
      
      t.timestamps
    end
  end
end
