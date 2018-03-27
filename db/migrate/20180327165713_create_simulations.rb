class CreateSimulations < ActiveRecord::Migration[5.1]
  def change
    create_table :simulations do |t|
      t.integer :obstaculos_derribados
      t.integer :velocidad_excedida
      t.integer :tiempo_simulacion
      t.datetime :cita
      t.datetime :fecha_aplicacion
      t.references :quiz, foreign_key: true

      t.timestamps
    end
  end
end
