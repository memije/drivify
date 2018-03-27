class Quiz < ApplicationRecord
  belongs_to :quiz_type
  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
  belongs_to :user, :class_name => 'User', :foreign_key => 'evaluator_id'
  has_many :user_answers
  has_one :simulation
end
