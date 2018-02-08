class AddUserToSimulation < ActiveRecord::Migration[5.1]
  def change
    add_column :simulations, :user_id, :integer
    add_column :simulations, :evaluator_id, :integer
    add_foreign_key :simulations, :users, column: :user_id, primary_key: :id
    add_foreign_key :simulations, :users, column: :evaluator_id, primary_key: :id
  end
end
