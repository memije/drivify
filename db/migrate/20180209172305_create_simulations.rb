class CreateSimulations < ActiveRecord::Migration[5.1]
  def change
    create_table :simulations do |t|
      t.integer :puntaje
      t.datetime :fecha_aplicacion
      t.references :quiz, foreign_key: true

      t.timestamps
    end
  end
end
