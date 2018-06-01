class CreateCelebrities < ActiveRecord::Migration[5.1]
  def change
    create_table :celebrities do |t|
      t.string :name
      t.string :last_name
      t.text :mini_description
      t.text :biography
      t.text :disclaimer
      t.boolean :popular
      t.boolean :featured
      t.integer :fee_min
      t.integer :fee_max
      t.references :state, foreign_key: true
      t.references :organization, foreign_key: true
      t.attachment :photo
      t.string :image_url
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
