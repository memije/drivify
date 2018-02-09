class QuizType < ApplicationRecord
  has_many :quizzes
  has_many :questions
end
