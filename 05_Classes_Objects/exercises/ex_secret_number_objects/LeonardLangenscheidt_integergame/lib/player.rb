# Player
#  Should initialize and store the player's name. 

class Player
	attr_accessor :name
	def initialize(name)
		@name = name
	end
	def greet
		"Alright, #{@name}. Welcome!"
	end
end
