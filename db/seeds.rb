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
("A".."E").each do |letra|
  QuizType.create({nombre: letra})
end

# Obtener el primer tipo de examen
type = QuizType.find(1)
# Crear pregunta para el tipo de examen
question = Question.create(quiz_type: type, pregunta: "Tiene la mayor jerarquía en la utilización del espacio vial.")
# Crear respuestas para la pregunta
Answer.create(inciso: "a", respuesta: "Ciclistas.", correcta: false, question: question)
Answer.create(inciso: "b", respuesta: "Usuarios de transporte particular automotor y motociclistas.", correcta: false, question: question)
Answer.create(inciso: "c", respuesta: "Usuarios del servicio de transporte público de pasajeros.", correcta: false, question: question)
Answer.create(inciso: "d", respuesta: "Peatones; en especial personas con discapacidad y movilidad limitada.", correcta: true, question: question)
Answer.create(inciso: "e", respuesta: "Prestadores del servicio de transporte público de pasajeros.", correcta: false, question: question)
# Crear pregunta para el tipo de examen
question = Question.create(quiz_type: type, pregunta: "Documento en donde se hace constar la infracción y la sanción correspondiente.")
# Crear respuestas para la pregunta
Answer.create(inciso: "a", respuesta: "Formato de hecho de tránsito.", correcta: false, question: question)
Answer.create(inciso: "b", respuesta: "Boleta.", correcta: true, question: question)
Answer.create(inciso: "c", respuesta: "Infracción.", correcta: false, question: question)
Answer.create(inciso: "d", respuesta: "Dispositivos para el control del tránsito.", correcta: false, question: question)
Answer.create(inciso: "e", respuesta: "Hecho de tránsito.", correcta: false, question: question)
# Crear pregunta para el tipo de examen
question = Question.create(quiz_type: type, pregunta: "En los carriles centrales de las vías de acceso controlado la velocidad máxima será de:")
# Crear respuestas para la pregunta
Answer.create(inciso: "a", respuesta: "50 km/h", correcta: false, question: question)
Answer.create(inciso: "b", respuesta: "40 km/h", correcta: false, question: question)
Answer.create(inciso: "c", respuesta: "80 km/h", correcta: true, question: question)
Answer.create(inciso: "d", respuesta: "60 km/h", correcta: false, question: question)
Answer.create(inciso: "e", respuesta: "20 km/h", correcta: false, question: question)
# Crear pregunta para el tipo de examen
question = Question.create(quiz_type: type, pregunta: "Multa por utilizar la bocina (claxon) para un fin diferente al de evitar un hecho de tránsito, especialmente en condiciones de congestión vehicular, así como provocar ruido excesivo con el motor.")
# Crear respuestas para la pregunta
Answer.create(inciso: "a", respuesta: "20 UCCM", correcta: false, question: question)
Answer.create(inciso: "b", respuesta: "20 a 30 UCCM", correcta: false, question: question)
Answer.create(inciso: "c", respuesta: "10 a 20 UCCM", correcta: false, question: question)
Answer.create(inciso: "d", respuesta: "10 UCCM", correcta: false, question: question)
Answer.create(inciso: "e", respuesta: "5 a 10 UCCM", correcta: true, question: question)
# Crear pregunta para el tipo de examen
question = Question.create(quiz_type: type, pregunta: "Los conductores deben rebasar otro vehículo sólo por el lado derecho.")
# Crear respuestas para la pregunta
Answer.create(inciso: "a", respuesta: "Verdadero.", correcta: false, question: question)
Answer.create(inciso: "b", respuesta: "Falso.", correcta: true, question: question)

# Obtener el primer tipo de examen
type = QuizType.find(2)
# Crear pregunta para el tipo de examen
question = Question.create(quiz_type: type, pregunta: "Tiene la mayor jerarquía en la utilización del espacio vial.")
# Crear respuestas para la pregunta
Answer.create(inciso: "a", respuesta: "Usuarios de transporte particular automotor y motociclistas.", correcta: false, question: question)
Answer.create(inciso: "b", respuesta: "Peatones; en especial personas con discapacidad y movilidad limitada.", correcta: true, question: question)
Answer.create(inciso: "c", respuesta: "Usuarios del servicio de transporte público de pasajeros.", correcta: false, question: question)
Answer.create(inciso: "d", respuesta: "Ciclistas.", correcta: false, question: question)
Answer.create(inciso: "e", respuesta: "Prestadores del servicio de transporte público de pasajeros.", correcta: false, question: question)
# Crear pregunta para el tipo de examen
question = Question.create(quiz_type: type, pregunta: "Personas que de forma temporal o permanente, debido a enfermedad, edad, accidente o alguna otra condición, realizan un desplazamiento lento, difícil o desequilibrado.")
# Crear respuestas para la pregunta
Answer.create(inciso: "a", respuesta: "Personas con movilidad limitada.", correcta: true, question: question)
Answer.create(inciso: "b", respuesta: "Personal de apoyo vial.", correcta: false, question: question)
Answer.create(inciso: "c", respuesta: "Persona con discapacidad.", correcta: false, question: question)
Answer.create(inciso: "d", respuesta: "Motociclista.", correcta: false, question: question)
Answer.create(inciso: "e", respuesta: "Peatón.", correcta: false, question: question)
# Crear pregunta para el tipo de examen
question = Question.create(quiz_type: type, pregunta: "En vías primarias la velocidad máxima será de:")
# Crear respuestas para la pregunta
Answer.create(inciso: "a", respuesta: "20 km/h", correcta: false, question: question)
Answer.create(inciso: "b", respuesta: "40 km/h", correcta: false, question: question)
Answer.create(inciso: "c", respuesta: "60 km/h", correcta: false, question: question)
Answer.create(inciso: "d", respuesta: "80 km/h", correcta: false, question: question)
Answer.create(inciso: "e", respuesta: "50 km/h", correcta: true, question: question)
# Crear pregunta para el tipo de examen
question = Question.create(quiz_type: type, pregunta: "Multa por no dar prioridad a los vehículos de emergencia que circulen con las señales luminosas y audibles encendidas.")
# Crear respuestas para la pregunta
Answer.create(inciso: "a", respuesta: "20 UCCM", correcta: false, question: question)
Answer.create(inciso: "b", respuesta: "20 a 30 UCCM", correcta: false, question: question)
Answer.create(inciso: "c", respuesta: "5 a 10 UCCM", correcta: false, question: question)
Answer.create(inciso: "d", respuesta: "10 a 20 UCCM", correcta: true, question: question)
Answer.create(inciso: "e", respuesta: "10 UCCM", correcta: false, question: question)
# Crear pregunta para el tipo de examen
question = Question.create(quiz_type: type, pregunta: "En caso de vehículos no motorizados, la indicación de giro o cambio de carril puede realizarse mediante señas.")
# Crear respuestas para la pregunta
Answer.create(inciso: "a", respuesta: "Verdadero.", correcta: true, question: question)
Answer.create(inciso: "b", respuesta: "Falso.", correcta: false, question: question)

# Obtener el primer tipo de examen
type = QuizType.find(3)
# Crear pregunta para el tipo de examen
question = Question.create(quiz_type: type, pregunta: "Tiene la mayor jerarquía en la utilización del espacio vial.")
# Crear respuestas para la pregunta
Answer.create(inciso: "a", respuesta: "Usuarios del servicio de transporte público de pasajeros.", correcta: false, question: question)
Answer.create(inciso: "b", respuesta: "Peatones; en especial personas con discapacidad y movilidad limitada.", correcta: true, question: question)
Answer.create(inciso: "c", respuesta: "Ciclistas.", correcta: false, question: question)
Answer.create(inciso: "d", respuesta: "Usuarios de transporte particular automotor y motociclistas.", correcta: false, question: question)
Answer.create(inciso: "e", respuesta: "Prestadores del servicio de transporte público de pasajeros.", correcta: false, question: question)

# Crear pregunta para el tipo de examen
question = Question.create(quiz_type: type, pregunta: "Ventaja que se le otorga a alguno de los usuarios de la vía para la utilización de un espacio de circulación; los otros vehículos tendrán que ceder el paso y circular detrás del usuario con prioridad o en su caso cambiar de carril.")
# Crear respuestas para la pregunta
Answer.create(inciso: "a", respuesta: "Preferencia de paso.", correcta: false, question: question)
Answer.create(inciso: "b", respuesta: "Programa de Verificación Vehicular.", correcta: false, question: question)
Answer.create(inciso: "c", respuesta: "Prioridad de uso.", correcta: true, question: question)
Answer.create(inciso: "d", respuesta: "Vía de acceso controlado.", correcta: false, question: question)
Answer.create(inciso: "e", respuesta: "Seguridad Vial.", correcta: false, question: question)
# Crear pregunta para el tipo de examen
question = Question.create(quiz_type: type, pregunta: "En zonas de tránsito calmado la velocidad será de:")
# Crear respuestas para la pregunta
Answer.create(inciso: "a", respuesta: "30 km/h", correcta: true, question: question)
Answer.create(inciso: "b", respuesta: "20 km/h", correcta: false, question: question)
Answer.create(inciso: "c", respuesta: "60 km/h", correcta: false, question: question)
Answer.create(inciso: "d", respuesta: "50 km/h", correcta: false, question: question)
Answer.create(inciso: "e", respuesta: "80 km/h", correcta: false, question: question)
# Crear pregunta para el tipo de examen
question = Question.create(quiz_type: type, pregunta: "Multa por exceder el límite de velocidad en vías primarias.")
# Crear respuestas para la pregunta
Answer.create(inciso: "a", respuesta: "20 a 30 UCCM", correcta: false, question: question)
Answer.create(inciso: "b", respuesta: "10 UCCM", correcta: false, question: question)
Answer.create(inciso: "c", respuesta: "5 a 10 UCCM", correcta: false, question: question)
Answer.create(inciso: "d", respuesta: "20 UCCM", correcta: false, question: question)
Answer.create(inciso: "e", respuesta: "10 a 20 UCCM", correcta: true, question: question)
# Crear pregunta para el tipo de examen
question = Question.create(quiz_type: type, pregunta: "Cuando exista congestión vehicular, si la luz del semáforo indica siga, se deberá continuar la circulación.")
# Crear respuestas para la pregunta
Answer.create(inciso: "a", respuesta: "Verdadero.", correcta: false, question: question)
Answer.create(inciso: "b", respuesta: "Falso.", correcta: true, question: question)

# Obtener el primer tipo de examen
type = QuizType.find(4)
# Crear pregunta para el tipo de examen
question = Question.create(quiz_type: type, pregunta: "Tiene la mayor jerarquía en la utilización del espacio vial.")
# Crear respuestas para la pregunta
Answer.create(inciso: "a", respuesta: "Usuarios del servicio de transporte público de pasajeros.", correcta: false, question: question)
Answer.create(inciso: "b", respuesta: "Ciclistas.", correcta: false, question: question)
Answer.create(inciso: "c", respuesta: "Prestadores del servicio de transporte público de pasajeros.", correcta: false, question: question)
Answer.create(inciso: "d", respuesta: "Peatones; en especial personas con discapacidad y movilidad limitada.", correcta: true, question: question)
Answer.create(inciso: "e", respuesta: "Usuarios de transporte particular automotor y motociclistas.", correcta: false, question: question)
# Crear pregunta para el tipo de examen
question = Question.create(quiz_type: type, pregunta: "Conjunto de políticas y sistemas orientados a la prevención de hechos de tránsito.")
# Crear respuestas para la pregunta
Answer.create(inciso: "a", respuesta: "Seguridad Pública.", correcta: false, question: question)
Answer.create(inciso: "b", respuesta: "Ley.", correcta: false, question: question)
Answer.create(inciso: "c", respuesta: "Preferencia de paso.", correcta: false, question: question)
Answer.create(inciso: "d", respuesta: "Seguridad Vial.", correcta: true, question: question)
Answer.create(inciso: "e", respuesta: "Prioridad de uso.", correcta: false, question: question)
# Crear pregunta para el tipo de examen
question = Question.create(quiz_type: type, pregunta: "En zonas escolares, de hospitales, de asilos, de albergues y casas hogar, la velocidad máxima será de:")
# Crear respuestas para la pregunta
Answer.create(inciso: "a", respuesta: "10 km/h", correcta: false, question: question)
Answer.create(inciso: "b", respuesta: "20 km/h", correcta: true, question: question)
Answer.create(inciso: "c", respuesta: "80 km/h", correcta: false, question: question)
Answer.create(inciso: "d", respuesta: "50 km/h", correcta: false, question: question)
Answer.create(inciso: "e", respuesta: "60 km/h", correcta: false, question: question)
# Crear pregunta para el tipo de examen
question = Question.create(quiz_type: type, pregunta: "Multa por exceder el límite de velocidad en vías secundarias.")
# Crear respuestas para la pregunta
Answer.create(inciso: "a", respuesta: "5 a 10 UCCM", correcta: false, question: question)
Answer.create(inciso: "b", respuesta: "20 UCCM", correcta: false, question: question)
Answer.create(inciso: "c", respuesta: "10 a 20 UCCM", correcta: true, question: question)
Answer.create(inciso: "d", respuesta: "20 a 30 UCCM", correcta: false, question: question)
Answer.create(inciso: "e", respuesta: "10 UCCM", correcta: false, question: question)
# Crear pregunta para el tipo de examen
question = Question.create(quiz_type: type, pregunta: "Entre las 23:00 horas y las 5:00 horas del día siguiente, se puede continuar con la marcha, aún cuando la luz del semáforo indique alto.")
# Crear respuestas para la pregunta
Answer.create(inciso: "a", respuesta: "Verdadero.", correcta: true, question: question)
Answer.create(inciso: "b", respuesta: "Falso.", correcta: false, question: question)

# Obtener el primer tipo de examen
type = QuizType.find(5)
# Crear pregunta para el tipo de examen
question = Question.create(quiz_type: type, pregunta: "Tiene la mayor jerarquía en la utilización del espacio vial.")
# Crear respuestas para la pregunta
Answer.create(inciso: "a", respuesta: "Ciclistas.", correcta: false, question: question)
Answer.create(inciso: "b", respuesta: "Usuarios del servicio de transporte público de pasajeros.", correcta: false, question: question)
Answer.create(inciso: "c", respuesta: "Prestadores del servicio de transporte público de pasajeros.", correcta: false, question: question)
Answer.create(inciso: "d", respuesta: "Usuarios de transporte particular automotor y motociclistas.", correcta: false, question: question)
Answer.create(inciso: "e", respuesta: "Peatones; en especial personas con discapacidad y movilidad limitada.", correcta: true, question: question)
# Crear pregunta para el tipo de examen
question = Question.create(quiz_type: type, pregunta: "Espacio físico cuya función es facilitar el flujo del tránsito vehicular continuo o controlado por semáforo.")
# Crear respuestas para la pregunta
Answer.create(inciso: "a", respuesta: "Vía de acceso controlado.", correcta: false, question: question)
Answer.create(inciso: "b", respuesta: "Vía primaria.", correcta: true, question: question)
Answer.create(inciso: "c", respuesta: "Vía pública.", correcta: false, question: question)
Answer.create(inciso: "d", respuesta: "Vía peatonal.", correcta: false, question: question)
Answer.create(inciso: "e", respuesta: "Zona de tránsito calmado.", correcta: false, question: question)
# Crear pregunta para el tipo de examen
question = Question.create(quiz_type: type, pregunta: "En estacionamientos y en vías peatonales en las cuales se permita el acceso a vehículos la velocidad máxima será de:")
# Crear respuestas para la pregunta
Answer.create(inciso: "a", respuesta: "30 km/h", correcta: false, question: question)
Answer.create(inciso: "b", respuesta: "50 km/h", correcta: false, question: question)
Answer.create(inciso: "c", respuesta: "20 km/h", correcta: false, question: question)
Answer.create(inciso: "d", respuesta: "10 km/h", correcta: true, question: question)
Answer.create(inciso: "e", respuesta: "80 km/h", correcta: false, question: question)
# Crear pregunta para el tipo de examen
question = Question.create(quiz_type: type, pregunta: "Puntos de penalización por exceder el límite de velocidad en zonas escolares, de hospitales, de asilos, de albergues y casas hogar.")
# Crear respuestas para la pregunta
Answer.create(inciso: "a", respuesta: "3", correcta: false, question: question)
Answer.create(inciso: "b", respuesta: "No aplica", correcta: false, question: question)
Answer.create(inciso: "c", respuesta: "6", correcta: true, question: question)
Answer.create(inciso: "d", respuesta: "1", correcta: false, question: question)
Answer.create(inciso: "e", respuesta: "2", correcta: false, question: question)
# Crear pregunta para el tipo de examen
question = Question.create(quiz_type: type, pregunta: "En las glorietas, el vehículo que pretende acceder a ella, tiene preferencia de paso sobre el que se encuentre adentro.")
# Crear respuestas para la pregunta
Answer.create(inciso: "a", respuesta: "Verdadero.", correcta: false, question: question)
Answer.create(inciso: "b", respuesta: "Falso.", correcta: true, question: question)

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

# User.all.each do |user|
#   if user.id != 1 && user.id != 2 && user.id != 3 && user.id != 4
#     Quiz.create(quiz_type: QuizType.order("RANDOM()").first, user: user)
#   end
# end
#
# quiz = Quiz.create(quiz_type: QuizType.order("RANDOM()").first, user: User.find(4), evaluator: User.find(2), fecha_aplicacion: DateTime.now, puntaje: 10)
# simulation = Simulation.create(quiz: quiz)
# # simulation = Simulation.create(quiz: quiz, fecha_aplicacion: DateTime.now, obstaculos_derribados: 10, tiempo_simulacion: 10000000)
# appointment =  Appointment.create(simulation: simulation, fecha: DateTime.now, hour: Hour.order("RANDOM()").first)