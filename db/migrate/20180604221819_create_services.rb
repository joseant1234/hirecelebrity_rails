class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string :name, null: false
      t.text :description
      t.integer :status, default: 0
      t.boolean :featured, default: false
      t.attachment :photo
      t.string :image_url

      t.timestamps
    end
  end
end
