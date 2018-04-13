class Quiz < ApplicationRecord
  belongs_to :quiz_type
  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
  belongs_to :evaluator, :class_name => 'User', :foreign_key => 'evaluator_id', optional: true
  has_many :user_answers, :dependent => :destroy
  has_one :simulation, :dependent => :destroy
  has_one :appointment, :dependent => :destroy, :through => :simulation

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

  def self.active_quizzes(quizzes)
    active_quizzes = []
    quizzes.each do |quiz|
      active_quizzes.push(quiz) if quiz.fecha_aplicacion.blank? || (!quiz.simulation.blank? && quiz.simulation.fecha_aplicacion.blank?)
    end
    return active_quizzes
  end

end
