class CreateTestimonialCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :testimonial_categories do |t|
      t.references :testimonial, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
