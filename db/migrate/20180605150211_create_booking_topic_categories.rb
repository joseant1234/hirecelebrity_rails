class CreateBookingTopicCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :booking_topic_categories do |t|
      t.references :booking_topic, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
