class CreateEventServices < ActiveRecord::Migration[5.1]
  def change
    create_table :event_services do |t|
      t.references :event, foreign_key: true
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
