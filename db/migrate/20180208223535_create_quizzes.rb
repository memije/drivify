class CreateQuizzes < ActiveRecord::Migration[5.1]
  def change
    create_table :quizzes do |t|
      t.datetime :fecha_aplicacion
      t.references :quiz_type, foreign_key: true

      t.timestamps
    end
  end
end
