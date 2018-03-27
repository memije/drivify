class AddForeignKeyToQuiz < ActiveRecord::Migration[5.1]
  def change
    add_column :quizzes, :user_id, :integer
    add_column :quizzes, :evaluator_id, :integer
    add_foreign_key :quizzes, :users, column: :user_id, primary_key: :id
    add_foreign_key :quizzes, :users, column: :evaluator_id, primary_key: :id
  end
end
