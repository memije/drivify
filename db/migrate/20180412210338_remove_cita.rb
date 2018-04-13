class RemoveCita < ActiveRecord::Migration[5.1]
  def change
    remove_column :simulations, :cita
  end
end
