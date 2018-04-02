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
# (1..10).each do |index|
# end

QuizType.create([
                    {nombre: 'A'},
                    {nombre: 'B'},
                    {nombre: 'C'},
                    {nombre: 'D'},
                    {nombre: 'E'},
                    {nombre: 'F'},
                    {nombre: 'G'},
                    {nombre: 'H'},
                    {nombre: 'I'},
                    {nombre: 'J'}
                ])

# User seed
User.create([
                {nombre: 'Daniel', ap_paterno: 'Memije', ap_materno: 'Fábrego', fecha_nacimiento: '01/01/1994', curp: 'BABB990101HDFXXX00', email: 'mail1@mail.com', password: '12345678', password_confirmation:'12345678',role: Role.find(1)},
                {nombre: 'Estefanía', ap_paterno: 'Yañez', ap_materno: 'Romero', fecha_nacimiento: '01/01/1994', curp: 'LALA990101MDFXXX00', email: 'mail2@mail.com', password: '12345678', password_confirmation: '12345678', role: Role.find(2)},
                {nombre: 'Sergio', ap_paterno: 'Granados', ap_materno: 'Solano', fecha_nacimiento: '01/01/1994', curp: 'SERG990101HDFXXX00', email: 'mail3@mail.com', password: '12345678', password_confirmation:'12345678', role: Role.find(3)}
            ])