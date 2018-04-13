class Hour < ApplicationRecord
  has_many :appointments

  def rango_horas
    "de #{hora_inicio} a #{hora_fin}"
  end

  def rango_simple_horas
    "#{hora_inicio} - #{hora_fin}"
  end
end
