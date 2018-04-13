class CreateHours < ActiveRecord::Migration[5.1]
  def change
    create_table :hours do |t|
      t.string :hora_inicio
      t.string :hora_fin

      t.timestamps
    end
  end
end
