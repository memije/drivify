# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def random_text(palabras)
  res = ""
  (0..palabras).each do |index|
    res = res+" "+(0...8).map { (65 + rand(26)).chr }.join
  end
  res
end

# Role seed
Role.create([
                {nombre: 'ADMIN', descripcion: 'Administrador del Sistema'},
                {nombre: 'EVALUADOR', descripcion: 'Evaluador de Examenes y Simulaciones'},
                {nombre: 'USUARIO', descripcion: 'Usuario General'}
            ])

Hour.create([
                {hora_inicio: '09:00 AM', hora_fin: '10:00 AM'},
                {hora_inicio: '10:00 AM', hora_fin: '11:00 AM'},
                {hora_inicio: '11:00 AM', hora_fin: '12:00 PM'},
                {hora_inicio: '12:00 PM', hora_fin: '01:00 PM'},
                {hora_inicio: '01:00 PM', hora_fin: '02:00 PM'},
                {hora_inicio: '02:00 PM', hora_fin: '03:00 PM'},
                # Hora de comida de 3 a 4
                {hora_inicio: '04:00 PM', hora_fin: '05:00 PM'},
                {hora_inicio: '05:00 PM', hora_fin: '06:00 PM'},
            ])


# QuizType seed
# (1..10).each do |index|
# end
#

# Crea tipos de la A a la J
("A".."J").each do |letra|
  QuizType.create({nombre: letra})
end

# Creacion de preguntas para los tipos de examenes
QuizType.all.each do |type|
  (1..5).each do |index|
    Question.create(quiz_type: type, pregunta: "#{random_text(20)}")
  end
end

Question.all.each do |question|
  ("a".."e").each do |index|
    Answer.create(inciso: index, respuesta: "#{random_text(5)}", correcta: false, question: question)
  end
end

# Creacion de respuestas para las preguntas

# User seed
User.create([
                {nombre: 'Daniel', ap_paterno: 'Memije', ap_materno: 'Fábrego', fecha_nacimiento: '01/01/1994', curp: 'BABB990101HDFXXX00', email: 'mail1@mail.com', password: '12345678', password_confirmation:'12345678',role: Role.find(1)},
                {nombre: 'Estefanía', ap_paterno: 'Yañez', ap_materno: 'Romero', fecha_nacimiento: '01/01/1994', curp: 'LALA990101MDFXXX00', email: 'mail2@mail.com', password: '12345678', password_confirmation: '12345678', role: Role.find(2)},
                {nombre: 'Sergio', ap_paterno: 'Granados', ap_materno: 'Solano', fecha_nacimiento: '01/01/1994', curp: 'SERG990101HDFXXX00', email: 'mail3@mail.com', password: '12345678', password_confirmation:'12345678', role: Role.find(3)}
            ])

(1..9).each do |index|
  User.create({
                  nombre: 'Prueba', ap_paterno: 'Prueba', ap_materno: 'Prueba', fecha_nacimiento: '01/01/1999', curp: "LALA990101HDFXXX0#{index}", email: "prueba#{index}@mail.com", password: '12345678', password_confirmation:'12345678',role: Role.find(3)
              })
end

User.all.each do |user|
  if user.id != 1 && user.id != 2 && user.id != 3 && user.id != 4
    Quiz.create(quiz_type: QuizType.order("RANDOM()").first, user: user)
  end
end

quiz = Quiz.create(quiz_type: QuizType.order("RANDOM()").first, user: User.find(4), evaluator: User.find(2), fecha_aplicacion: DateTime.now, puntaje: 10)
simulation = Simulation.create(quiz: quiz)
# simulation = Simulation.create(quiz: quiz, fecha_aplicacion: DateTime.now, obstaculos_derribados: 10, tiempo_simulacion: 10000000)
appointment =  Appointment.create(simulation: simulation, fecha: DateTime.now, hour: Hour.order("RANDOM()").first)