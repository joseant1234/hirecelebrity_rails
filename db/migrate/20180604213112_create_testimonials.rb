class CreateTestimonials < ActiveRecord::Migration[5.1]
  def change
    create_table :testimonials do |t|
      t.text :description, null: false
      t.boolean :featured, default: false
      t.references :resource, polymorphic: true, index: true

      t.timestamps
    end
  end
end
