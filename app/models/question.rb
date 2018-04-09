class Question < ApplicationRecord
  belongs_to :quiz_type
  has_many :answers, :dependent => :destroy
  has_many :user_answers, :dependent => :destroy

  def pregunta_truncada
    pregunta.truncate(50, omission: "...")
  end
end
