# Se tiene un array que contiene los números de una ruleta.

#r = (1..10).to_a
# Se pide:

# Crear una clase llamada Roulette.
# Crear un método de instancia llamado play que reciba como argumento un número al cual se está apostando. 
# Luego debe tomar un valor -del array- al azar y compararlo con el número al cual se apostó.

# Crear un método de instancia que:
# Debe almacenar el número generado al azar en un archivo llamado roulette_history.txt
# Si el número al cual se apostó corresponde al generado al azar entonces, debe además almacenar ese 
# número en un archivo llamado winners.txt
# Crear un método que lea el archivo rouletter_history.txt y retorne el valor que más ha generado la ruleta 
# históricamente.

require 'date'

class Roulette
	attr_accessor :r, :num_apostado

	def initialize(num_apostado)
		@r = rand(1..10).to_i
		@num_apostado = num_apostado
	end

	def escribe_archiv(archivo)
		File.open(archivo, 'a') do |line| 
		line.write "Numero Azar: #{@r}, Numero Apuesta: #{@num_apostado}, Fecha: #{Time.new()} \n"
		end
	end

	def registro
		self.escribe_archiv("roulette_history.txt")
		if @r == @num_apostado
			self.escribe_archiv("roulette_winners.txt")
		end
	end

	def numero_mas_repetido
		hash_historico = []
		File.open("roulette_history.txt", 'r') do |file|
  			data = file.readlines
			data.each do |sptl|
				ls = sptl.split(', ')
				hash_historico << ls[0]
			end
		end
		hash_historico.sort.group_by { |dt| dt }.map {|x, y|[y.size, x]}.sort.last
	end

end 

num = Roulette.new(rand(1..10).to_i)
num.registro
print num.numero_mas_repetido
