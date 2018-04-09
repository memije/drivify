class Role < ApplicationRecord
  has_many :users, :dependent => :destroy

  def nombre_descripcion
    "#{nombre} - #{descripcion}"
  end
end
