# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Rol.create([{nombre: 'ADMIN',descripcion: 'Administrador del Sistema'}])
Rol.create([{nombre: 'EVALUADOR',descripcion: 'Encargado de aplicar la Evaluación'}])
Rol.create([{nombre: 'USUARIO',descripcion: 'Usuario General'}])

# Usuario.create([{nombre: 'Daniel Izacar', ap_pat: 'Memije', ap_mat: 'Fábrego', curp: 'MEFD940912HDFMBN06', fecha_nac: '30/12/1994', email: 'd.memije26@gmail.com', contrasena: '1', rol: Rol.find(1)}])
