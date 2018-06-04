class CreateClientCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :client_categories do |t|
      t.references :client, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
