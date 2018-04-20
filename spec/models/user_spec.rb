require 'rails_helper'
require 'ffaker'

RSpec.describe User, type: :model do

  it 'es inválido si no tiene un rol asignado' do
    password = FFaker::Internet.password
    usuario = User.new({
                           nombre: FFaker::NameMX.name,
                           ap_paterno: FFaker::NameMX.last_name,
                           ap_materno: FFaker::NameMX.last_name,
                           fecha_nacimiento: FFaker::Time.between(Date.new(1990, 01, 01), Date.new(2000, 01, 01)),
                           curp: FFaker::IdentificationMX.curp,
                           email: FFaker::Internet.free_email,
                           password: password,
                           password_confirmation: password,
                           role: nil
                       })
    expect(usuario).not_to be_valid
  end

  it 'es inválido si el correo del usuario no es único' do
    role = Role.create({nombre: 'ADMIN', descripcion: 'Administrador del Sistema'})
    mail = FFaker::Internet.free_email
    password = FFaker::Internet.password
    usuario1 = User.create({
                          nombre: FFaker::NameMX.name,
                          ap_paterno: FFaker::NameMX.last_name,
                          ap_materno: FFaker::NameMX.last_name,
                          fecha_nacimiento: FFaker::Time.between(Date.new(1990, 01, 01), Date.new(2000, 01, 01)),
                          curp: FFaker::IdentificationMX.curp,
                          email: mail,
                          password: password,
                          password_confirmation: password,
                          role: role
                       })
    usuario2 = User.new({
                          nombre: FFaker::NameMX.name,
                          ap_paterno: FFaker::NameMX.last_name,
                          ap_materno: FFaker::NameMX.last_name,
                          fecha_nacimiento: FFaker::Time.between(Date.new(1990, 01, 01), Date.new(2000, 01, 01)),
                          curp: FFaker::IdentificationMX.curp,
                          email: mail,
                          password: password,
                          password_confirmation: password,
                          role: role
                       })
    expect(usuario2).not_to be_valid
  end

  it 'es inválido si las contraseñas no coinciden' do
    role = Role.create({nombre: 'ADMIN', descripcion: 'Administrador del Sistema'})
    usuario = User.create({
                              nombre: FFaker::NameMX.name,
                              ap_paterno: FFaker::NameMX.last_name,
                              ap_materno: FFaker::NameMX.last_name,
                              fecha_nacimiento: FFaker::Time.between(Date.new(1990, 01, 01), Date.new(2000, 01, 01)),
                              curp: FFaker::IdentificationMX.curp,
                              email: FFaker::Internet.free_email,
                              password: FFaker::Internet.password,
                              password_confirmation: FFaker::Internet.password,
                              role: role
                          })
    expect(usuario).not_to be_valid
  end

  it 'es válido con nombre, apellido paterno, apellido materno, fecha de nacimiento, curp, email y si las contraseña coinciden' do
    role = Role.create({nombre: 'ADMIN', descripcion: 'Administrador del Sistema'})
    password = FFaker::Internet.password
    usuario = User.new({
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
    expect(usuario).to be_valid
  end

end
