class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.text :extract
      t.text :description      
      t.attachment :photo
      t.string :image_url
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
