class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.integer :status, default: 0
      t.integer :celebrity_categories_count, default: 0
      t.integer :service_categories_count, default: 0
      t.integer :booking_topic_categories_count, default: 0
      t.integer :client_categories_count, default: 0
      t.integer :site_categories_count, default: 0
      t.integer :organization_categories_count, default: 0

      t.timestamps
    end
  end
end
