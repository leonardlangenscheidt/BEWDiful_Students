# Game
#	This class holds most of the game logic and should:
#		Welcome players and inform them of the game rules.
#		Initialize the Player class.
# 		Initialize the Secret Number class.
# 		Prompt the user to choose a number, verify if the user guessed correctly.
# 		If the user guesses incorrectly let them know if they were too high or too low.
#		Monitor how many guesses the player has before the game is over.

class Game
	attr_accessor :guess, :player, :secret, :counter, :prior_guesses
	def initialize(player: player, secret: secret)
		@player = player
		@secret = secret
		@counter = 3
		@prior_guesses = []
	end

	def rules
		puts "You are about to play the one and only Grand Number Guessing Game. I've just come up with an exiting and intriguing number between 1 and 10."
		puts "You will try and guess it. All you have is three guesses so don't waste them too easily."
		puts "Have fun now and good luck!"
	end

	def round
		puts "This is Round ##{4-@counter}. What's your guess?"
		@guess = gets.chomp.to_i
		if @guess == @secret
			puts "Oh damn! That's right! Nicely done. You win!"
			@counter -=4
		elsif @guess >10 || @guess<1
			puts "You kidding me? That's not even between 1 and 10. Try again!"
		elsif @prior_guesses.include? @guess
			puts "You've already guessed that. It was wrong then, and it's just as wrong now!"
		else
			if @counter==1
				puts "Not it either. The secret number was #{@secret} but you're out of guesses."
			else
				if @guess>@secret
					puts "Not quite. Try a lower number."
				else
					puts "Not quite. Try a higher number."
				end
			end
			@counter -= 1
			@prior_guesses.push(@guess)
		end
	end
end
