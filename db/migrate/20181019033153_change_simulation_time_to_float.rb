class ChangeSimulationTimeToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :simulations, :tiempo_simulacion, :decimal
  end
end
