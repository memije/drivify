class Question < ApplicationRecord
  belongs_to :quiz_type
  has_many :answers
  has_many :user_answers
end
