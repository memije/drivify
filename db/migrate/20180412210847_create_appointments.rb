class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.date :fecha
      t.references :simulation, foreign_key: true
      t.references :hour, foreign_key: true

      t.timestamps
    end
  end
end
