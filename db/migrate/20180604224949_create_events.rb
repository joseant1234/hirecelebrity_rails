class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.references :celebrity, foreign_key: true
      t.string :title, null: false
      t.text :body, null: false
      t.attachment :photo
      t.string :image_url

      t.timestamps
    end
  end
end
