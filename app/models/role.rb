class Role < ApplicationRecord

  validates :nombre, :descripcion, presence: true
  has_many :users, :dependent => :destroy

  def nombre_descripcion
    "#{nombre} - #{descripcion}"
  end
end
