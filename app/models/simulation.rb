class Simulation < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :evaluator, class_name: 'User'
  belongs_to :quiz
end
