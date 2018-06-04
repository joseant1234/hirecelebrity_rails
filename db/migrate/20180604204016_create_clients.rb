class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.boolean :featured, default: false
	    t.attachment :photo
      t.string :image_url
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
