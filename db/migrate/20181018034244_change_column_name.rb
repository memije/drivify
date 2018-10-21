class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :simulations, :velocidad_excedida, :velocidad_promedio
  end
end
