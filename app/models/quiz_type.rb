class QuizType < ApplicationRecord
  validates :nombre, uniqueness: true
  has_many :quizzes, :dependent => :destroy
  has_many :questions, :dependent => :destroy
end
