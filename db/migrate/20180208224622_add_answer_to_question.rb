class AddAnswerToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :answer_id, :integer
    add_foreign_key :questions, :answers, column: :answer_id, primary_key: :id
  end
end
