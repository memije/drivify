require 'rails_helper'

RSpec.describe Role, type: :model do

  it 'es inválido si no tiene un nombre' do
    rol = Role.new({
                      nombre: nil,
                      descripcion: FFaker::Lorem.word
                   })
    expect(rol).not_to be_valid
  end

  it 'es inválido si no tiene una descripción' do
    rol = Role.new({
                       nombre: FFaker::Lorem.word,
                       descripcion: nil
                   })
    expect(rol).not_to be_valid
  end

  it 'es válido si tiene un nombre y descripción' do
    rol = Role.new({
                       nombre: FFaker::Lorem.word,
                       descripcion: FFaker::Lorem.word
                   })
    expect(rol).to be_valid
  end

end
