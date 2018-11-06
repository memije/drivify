class ChangeAverageSpeedToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :simulations, :velocidad_promedio, :decimal
  end
end
