class Quiz < ApplicationRecord
  belongs_to :quiz_type
  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
  belongs_to :evaluator, :class_name => 'User', :foreign_key => 'evaluator_id', optional: true
  has_many :user_answers, :dependent => :destroy
  has_one :simulation, :dependent => :destroy

  def get_color
    if evaluator.blank? && fecha_aplicacion.blank? && puntaje.blank?
      "yellow-bg"
    elsif !evaluator.blank? && fecha_aplicacion.blank? && puntaje.blank?
      "blue-bg"
    else
      "lazur-bg"
    end
  end

  def get_estado
    if evaluator.blank? && fecha_aplicacion.blank? && puntaje.blank?
      1
    elsif !evaluator.blank? && fecha_aplicacion.blank? && puntaje.blank?
      2
    else
      3
    end
  end

end
