require 'rails_helper'

RSpec.describe Quiz, type: :model do

  it 'es inválido si no tiene un tipo de examen teórico' do
    role = Role.create({nombre: 'ADMIN', descripcion: 'Administrador del Sistema'})
    password = FFaker::Internet.password
    usuario = User.create({
                           nombre: FFaker::NameMX.name,
                           ap_paterno: FFaker::NameMX.last_name,
                           ap_materno: FFaker::NameMX.last_name,
                           fecha_nacimiento: FFaker::Time.between(Date.new(1990, 01, 01), Date.new(2000, 01, 01)),
                           curp: FFaker::IdentificationMX.curp,
                           email: FFaker::Internet.free_email,
                           password: password,
                           password_confirmation: password,
                           role: role
                       })
    quiz = Quiz.new(user: usuario, quiz_type: nil)
    expect(quiz).not_to be_valid
  end

  it 'es inválido si no tiene un usuario' do
    quiz_type = QuizType.create(nombre: FFaker::Lorem.word)
    quiz = Quiz.new(user: nil, quiz_type: quiz_type)
    expect(quiz).not_to be_valid
  end

  it 'es válido si tiene un tipo de examen teórico y un usuario' do
    quiz_type = QuizType.create(nombre: FFaker::Lorem.word)
    role = Role.create({nombre: 'ADMIN', descripcion: 'Administrador del Sistema'})
    password = FFaker::Internet.password
    usuario = User.create({
                              nombre: FFaker::NameMX.name,
                              ap_paterno: FFaker::NameMX.last_name,
                              ap_materno: FFaker::NameMX.last_name,
                              fecha_nacimiento: FFaker::Time.between(Date.new(1990, 01, 01), Date.new(2000, 01, 01)),
                              curp: FFaker::IdentificationMX.curp,
                              email: FFaker::Internet.free_email,
                              password: password,
                              password_confirmation: password,
                              role: role
                          })
    quiz = Quiz.new(user: usuario, quiz_type: quiz_type)
    expect(quiz).to be_valid

  end

end
