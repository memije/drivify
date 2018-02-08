class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :nombre
      t.string :ap_paterno
      t.string :ap_materno
      t.date :fecha_nacimiento
      t.string :curp
      t.string :email
      t.string :password_digest
      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end
