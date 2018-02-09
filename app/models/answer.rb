class Answer < ApplicationRecord
  belongs_to :question
  has_one :question
  has_one :user_answer
end
