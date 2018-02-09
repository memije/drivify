class Quiz < ApplicationRecord
  has_many :simulations
  has_many :user_answers
  belongs_to :user, class_name: 'User'
  belongs_to :evaluator, class_name: 'User'
  belongs_to :quiz_type
end
