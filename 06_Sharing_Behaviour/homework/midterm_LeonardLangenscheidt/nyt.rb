require_relative 'lib/story'
require_relative 'lib/story_board'
require_relative 'lib/remote_source'
require_relative 'lib/search'

def add_remote_stories(term)
  RemoteSource.get(term).each do |story|
    StoryBoard.add_story story #adds story to an array of stories.
  end
end

def show_story_board
  StoryBoard.stories.each do |story| #StoryBorad.stories returns an array of stories
    puts story 
  end
end


puts "\nWelcome to the New York Times Story Aggregator. Filter and display like cray!"

Search.regular

add_remote_stories(Search.output)

while StoryBoard.board == []
  Search.clarify
  add_remote_stories(Search.output)
end


puts "\nThe NYT Story Aggregator has found the following matches:"
show_story_board

puts "\nThank you for using the New York Times Story Aggregator!"
puts "\n"
