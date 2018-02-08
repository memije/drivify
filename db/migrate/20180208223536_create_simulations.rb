class CreateSimulations < ActiveRecord::Migration[5.1]
  def change
    create_table :simulations do |t|
      t.integer :puntaje
      t.datetime :fecha_aplicacion

      t.timestamps
    end
  end
end
