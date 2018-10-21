class CreateSimulationSpeedPollings < ActiveRecord::Migration[5.1]
  def change
    create_table :simulation_speed_pollings do |t|
      t.decimal :speed
      t.integer :second
      t.references :simulation, foreign_key: true

      t.timestamps
    end
  end
end
