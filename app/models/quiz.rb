class Quiz < ApplicationRecord
  belongs_to :quiz_type
  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
  belongs_to :evaluator, :class_name => 'User', :foreign_key => 'evaluator_id', optional: true
  has_many :user_answers, :dependent => :destroy
  has_one :simulation, :dependent => :destroy
end
