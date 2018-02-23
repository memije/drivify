# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Role seed
Role.create([
                {nombre: 'ADMIN', descripcion: 'Administrador del Sistema'},
                {nombre: 'EVALUADOR', descripcion: 'Evaluador de Examenes y Simulaciones'},
                {nombre: 'USUARIO', descripcion: 'Usuario General'}
            ])


# QuizType seed
(1..10).each do |index|
  QuizType.create()
end

# User seed
User.create([
                {nombre: 'Daniel', ap_paterno: 'Memije', ap_materno: 'Fábrego', fecha_nacimiento: '01/01/1994', curp: 'BABB990101HDFMBN01', email: 'mail1@mail.com', password: '1', password_confirmation:'1',role: Role.find(1)},
                {nombre: 'Sergio', ap_paterno: 'Granados', ap_materno: 'Solano', fecha_nacimiento: '01/01/1994', curp: 'SERG010194HDFXXX00', email: 'mail2@mail.com', password: 'hola', password_confirmation:'hola', role: Role.find(1)}
            ])