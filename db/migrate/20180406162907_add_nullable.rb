class AddNullable < ActiveRecord::Migration[5.1]
  def change
    # tabla de evaluaciones teoricas
    change_column_null :quizzes, :fecha_aplicacion, true
    change_column_null :quizzes, :puntaje, true
    change_column_null :quizzes, :evaluator_id, true

    # tabla de simulaciones
    change_column_null :simulations, :fecha_aplicacion, true
    change_column_null :simulations, :obstaculos_derribados, true
    change_column_null :simulations, :velocidad_excedida, true
    change_column_null :simulations, :tiempo_simulacion, true
  end
end
