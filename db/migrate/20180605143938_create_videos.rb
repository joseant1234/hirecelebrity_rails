class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :name, null: false
        t.string :url
        t.boolean :featured, default: false
        t.references :celebrity, foreign_key: true

        t.timestamps
    end
  end
end
