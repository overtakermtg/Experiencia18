# El archivo cursos.txt contiene las fechas de inicio y término de cursos dictados por Desafío Latam 
# durante el año 2017, con la siguiente estructura:

# Front-end, 2017-05-21, 2017-08-10
# Wordpress, 2017-04-12, 2017-11-04
# Full-stack, 2017-07-09, 2017-12-29
# Android, 2017-05-17, 2017-08-13
# Marketing, 2017-03-14, 2017-10-20

# Se pide:
# Crear una clase Course cuyo constructor reciba el nombre del curso y las fechas de inicio y término.
# Crear un método que permita leer el archivo y crear una instancia de la clase Course por línea del archivo.

# Crear métodos que permitan:
# Saber qué cursos comienzan previo a una fecha entregada como argumento.
# Saber qué cursos finalizan posterior a una fecha entregada como argumento.
# En ambos el métodos argumento por defecto debe ser la fecha de hoy.
# Ambos métodos deben levantar una excepción si la fecha recibida es >= 2018-01-01.

require 'date'

class Course
	attr_accessor :nombre, :fecInicio, :fecFinal
	def initialize(nombre, fecInicio, fecFinal)
		@nombre = nombre
		@fecInicio = Date.strptime(fecInicio)
		@fecFinal = Date.strptime(fecFinal)
	end

	def cursos_estado(fecEvalua)
		if fecEvalua.between?(@fecInicio, @fecFinal) 
				"En progreso"
			elsif fecEvalua == Date.strptime('2018-01-01')
				begin
					raise "Error de fecha! "
				rescue Exception => msg
				    puts msg
				end  
			elsif fecEvalua <= @fecInicio
				"Comienza pronto"
			elsif fecEvalua >= @fecFinal
				"Finalizado"
			else
				"Otros"
		end
 	end
end
# +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
# +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
# +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+

	dt = []
	arr_cursos = []
	File.open('cursos.txt', 'r') do |file| 
		data = file.readlines.map(&:chomp)
		data.each do |f1|
			dt = f1.split(', ')
			# en arr_cursos estoy guardadndo todas las instancias de table
			arr_cursos << Course.new(*dt)
		end
	end

	arr_cursos.each do |curs|
		# puts "El curso: #{curs.nombre}, #{curs.cursos_estado(Date.strptime('2018-01-01'))}"
		  puts "El curso: #{curs.nombre}, #{curs.cursos_estado(Date.strptime(Time.new().to_date.to_s))}"
	end

