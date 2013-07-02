# Runner
#	This is the main file that you will run (a.k.a. your 'runner' file'). You will invoke this with ruby runner.rb
# The runner.rb file is NOT a class, but is just a file with Ruby that will perform tasks and create classes
# It will require other classes from other files as needed
# This file will contain Ruby code that will:
# - Say hello to the user
# - Ask for the player's name
# - Create a new Player instance with the name
# - Create a new Game instance, and pass it the Player instance as an argument
# - Tell the game to display the rules
# - Tell the game to start

require_relative 'lib/player'
require_relative 'lib/game'
require_relative 'lib/secretnumber'

#Initial Greeting
puts "Ladies and Gentlemen! Welcome to the Grand Number Guessing Game!"
puts "May I ask for your name?"

#Initialize Player and greet
player_name = gets.chomp.capitalize
user = Player.new(player_name)
puts user.greet

game1 = Game.new(player: user.name, secret: Secret.give)

game1.rules

while game1.counter>0
	game1.round
end

if game1.counter<0
	puts "Congratulations. The game, however, has come to an end."
else
	puts "Which means you lost! That's what you get for rushing through your guesses. Let's hope you'll do better next time."
end