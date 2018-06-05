class CreatePhotographs < ActiveRecord::Migration[5.1]
  def change
    create_table :photographs do |t|
      t.attachment :photo
      t.string :image_url
      t.integer :section, null: false
      t.string :title, null: false
      t.string :subtitle
      t.string :url
      t.references :site, foreign_key: true

      t.timestamps
    end
  end
end
