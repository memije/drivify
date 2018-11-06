class AddTrafficLightsToSimulations < ActiveRecord::Migration[5.1]
  def change
    add_column :simulations, :semaforos, :integer
  end
end
