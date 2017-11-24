# El archivo casino.txt contiene las recaudaciones de 4 días de un casino 
# separadas por mesa de juego.

# Mesa 1, 90, 60, 10, 30
# Mesa 2, 40, 34, 77, 11
# Mesa 3, 34, 86, 55, 91
# Mesa 4, 67, 93, 43, 87

# Se pide:
# Crear una clase Table cuyo constructor reciba el nombre de la mesa y las 
# recaudaciones correspondientes de cada día.

	# Hint: El constructor debe recibir 5 argumentos. Uno para el nombre de la mesa y 
	# los demás para cada recaudación correspondiente a esa mesa.
	# Crear un método que permita leer el archivo e instanciar un objeto de la clase 
	# Table por cada línea del archivo.

# Crear métodos que permitan:

# Conocer el mayor valor recaudado, por mesa, y el nombre de la mesa y día 
#corresponde (día 1, día 2, día 3 o día 4).

# Calcular el promedio total de lo recaudado por todas las mesas en todos los días.

class Table 
	attr_accessor :mesa
	def initialize(mesa, dia1, dia2, dia3, dia4)
		@mesa = mesa
		@dia1 = dia1.to_i
		@dia2 = dia2.to_i
		@dia3 = dia3.to_i
		@dia4 = dia4.to_i
	end

	def mayor_mesa()
		data = [@dia1, @dia2, @dia3, @dia4]
		return data.index(data.sort.last)+1, data.sort.last
	end

	def total_x_mesa()
		data = [@dia1, @dia2, @dia3, @dia4].sum
	end
end

#-----------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------


	dt = []
	arr_mesas = []
	File.open('casino.txt', 'r') do |file| 
		data = file.readlines.map(&:chomp)
		data.each do |f1|
			dt = f1.split(', ')
			# en arr_mesas estoy guardadndo todas las instancias de table
			arr_mesas << Table.new(*dt)
		end
	end

	# recorro el arreglo con las instancias para llamar al metodo
	arr_mesas.each do |mesa|
		idx, rec = mesa.mayor_mesa
		puts "La mesa: #{mesa.mesa} tiene como mayor recaudacion: #{rec}, y es el dia : #{idx}"
	end

	arr_mesas.each do |mesa|
		puts "el total de la #{mesa.mesa} es : #{mesa.total_x_mesa}"
	end

