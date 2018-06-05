class CreateSites < ActiveRecord::Migration[5.1]
  def change
    create_table :sites do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.string :image_logo_url
      t.attachment :logo
      t.string :phone, null: false
      t.string :facebook_url
      t.string :twitter_url
      t.integer :banner_option, null: false
      t.text :who_we_are, null: false
      t.text :general_service, null: false
      t.string :header_info
      t.text :terms_and_conditions, null: false
      t.string :primary_color, default: "#5900D0"
      t.string :accent_color, default: "#FF003E"
      t.string :gradient_accent_color, default: "#F00000"
      t.string :footer_color, default: "#3A3A3A"
      t.text :footer
      t.integer :status, default: 0
      t.string :state
      t.references :admin, foreign_key: true

      t.timestamps
    end
  end
end
