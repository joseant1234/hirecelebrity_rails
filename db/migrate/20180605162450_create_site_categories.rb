class CreateSiteCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :site_categories do |t|
      t.references :site, foreign_key: true
      t.references :category, foreign_key: true
      t.boolean :show_in_footer, default: false
      
      t.timestamps
    end
  end
end
