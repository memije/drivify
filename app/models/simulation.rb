class Simulation < ApplicationRecord
  belongs_to :quiz
  has_one :appointment, :dependent => :destroy
  has_many :simulation_speed_pollings, :dependent => :destroy

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

  def duracion_horas_minutos_segundos
    seconds = tiempo_simulacion % 60
    minutes = (tiempo_simulacion / 60) % 60
    hours = tiempo_simulacion / (60 * 60)
    format("%02d:%02d:%02d", hours, minutes, seconds)
  end

  def get_horas
    appointment.hour
  end
end
