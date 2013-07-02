# Secret_Number
#   This class should initiate an array of numbers that range between 1 - 10.
#   Use a method from the array class to select a random element from that array. This random number will be the secret number. 
#   This way the secret number is also a secret to you.

class Secret
	attr_accessor :numbers, :secretnum

	@@numbers = (1..10).to_a

	@@secretnum = @@numbers.sample

	def self.give
		@@secretnum
	end
end