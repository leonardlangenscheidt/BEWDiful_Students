class StoryBoard
	@@again = "y"
	@@board = []
	
	def self.add_story(story)
		@@board << story
	end

	def self.stories
		@@board.map do |instance|
			"Story: #{instance.title}, Categories: #{instance.category}"
		end
	end

	def self.board
		@@board
	end

	def self.clear
		@@board = []
	end

end
