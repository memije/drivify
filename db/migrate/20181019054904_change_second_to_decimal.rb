class ChangeSecondToDecimal < ActiveRecord::Migration[5.1]
  def change
    change_column :simulation_speed_pollings, :second, :decimal
  end
end
