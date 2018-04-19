require 'rails_helper'
require 'ffaker'

RSpec.describe User,'#create', type: :model do

  it 'es invalido si no tiene un rol asignado' do
    usuario = User.new({
                           nombre: FFaker::Name.name,
                           ap_paterno: 'Prueba',
                           ap_materno: 'Prueba',
                           fecha_nacimiento: '01/01/1999',
                           curp: "LALA990101HDFXXX01",
                           email: "pruebax@mail.com",
                           password: '12345678',
                           password_confirmation:'12345678',
                           role: nil
                       })
    expect(usuario).not_to be_valid
  end

  it 'es valido con nombre, apellido peterno, apellido materno, fecha de nacimiento, curp, email y si la contraseña coincide' do
    role = Role.create({nombre: 'ADMIN', descripcion: 'Administrador del Sistema'})
    usuario = User.new({
                           nombre: 'Prueba',
                           ap_paterno: 'Prueba',
                           ap_materno: 'Prueba',
                           fecha_nacimiento: '01/01/1999',
                           curp: "LALA990101HDFXXX01",
                           email: "pruebax@mail.com",
                           password: '12345678',
                           password_confirmation:'12345678',
                           role: role
                       })
    expect(usuario).to be_valid
  end

  it 'es invalido si el correo del usuario se repite' do
    role = Role.create({nombre: 'ADMIN', descripcion: 'Administrador del Sistema'})
    usuario1 = User.create({
                           nombre: 'Prueba',
                           ap_paterno: 'Prueba',
                           ap_materno: 'Prueba',
                           fecha_nacimiento: '01/01/1999',
                           curp: "LALA990101HDFXXX01",
                           email: "pruebax@mail.com",
                           password: '12345678',
                           password_confirmation:'12345678',
                           role: role
                       })
    usuario2 = User.new({
                           nombre: 'Prueba',
                           ap_paterno: 'Prueba',
                           ap_materno: 'Prueba',
                           fecha_nacimiento: '01/01/1999',
                           curp: "LALA990101HDFXXX01",
                           email: "pruebax@mail.com",
                           password: '12345678',
                           password_confirmation:'12345678',
                           role: role
                       })
    expect(usuario2).not_to be_valid
  end

  it 'es invalido si las contraseñas no coinciden' do
    role = Role.create({nombre: 'ADMIN', descripcion: 'Administrador del Sistema'})
    usuario = User.create({
                              nombre: 'Prueba',
                              ap_paterno: 'Prueba',
                              ap_materno: 'Prueba',
                              fecha_nacimiento: '01/01/1999',
                              curp: "LALA990101HDFXXX01",
                              email: "pruebax@mail.com",
                              password: '12345678',
                              password_confirmation:'12345678',
                              role: role
                          })
    expect(usuario).not_to be_valid
  end

end
