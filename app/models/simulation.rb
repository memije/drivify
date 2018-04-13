class Simulation < ApplicationRecord
  belongs_to :quiz
  has_one :appointment, :dependent => :destroy

  def get_color
    if fecha_aplicacion.blank?
      "blue-bg"
    else
      "lazur-bg"
    end
  end

  def get_estado
    if fecha_aplicacion.blank?
      1
    else
      2
    end
  end

  def duracion_horas_minutos
    horas = tiempo_simulacion / (1000 * 60 * 60)
    minutos = tiempo_simulacion / (1000 * 60) % 60
    "#{horas} horas con #{minutos} minutos"
  end
end
