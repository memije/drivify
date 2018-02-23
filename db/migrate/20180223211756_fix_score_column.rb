class FixScoreColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :simulations, :tiempo, :string
  end
end
