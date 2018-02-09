class Question < ApplicationRecord
  belongs_to :quiz_type
  belongs_to :answer
  has_many :answers
  has_one :user_answer
end
