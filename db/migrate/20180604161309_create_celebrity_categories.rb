class CreateCelebrityCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :celebrity_categories do |t|
      t.references :celebrity, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
