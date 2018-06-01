class CreateOrganizationCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :organization_categories do |t|
      t.references :organization, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
