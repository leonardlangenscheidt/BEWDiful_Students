require_relative 'story'
require_relative 'remote_source'
require_relative 'story_board'

class Search

	@@specifier = ""
	@@tagspec = ""
	@@output = ""
	@@tagsearch = ""

	def self.regular
		puts "\nSearch for any keyword and separate entries with a comma. Proceed to advanced search by entering 1."
		input = gets.chomp.gsub(/\s+/, "").downcase
		if input.to_i == 1
			self.advanced
		else
			@@output = input
		end
	end

	def self.advanced
		puts "\nAdvanced search:\n1. Search by title\n2. Search by tags"
  		choice = gets.chomp.to_i
  		if choice == 1
  			puts "What title element would you like to search for?"
    		@@specifier = "title:"
    		@@output = @@specifier + gets.chomp.gsub(/\s+/, "").downcase
  		elsif choice == 2
  			self.tags
  		end
  	end

  	def self.tags
  		puts "\nSearching by tag:\n1. By descriptive tag\n2. By geographic tag\n3. By organization tag\n4. By person tag"
    	tagchoice = gets.chomp.to_i
    	if tagchoice == 1
  		   	@@tagspec = "des"
  		elsif tagchoice == 2
  		    @@tagspec = "geo"
  		elsif tagchoice == 3
   		   @@tagspec = "org"
  		elsif tagchoice == 4
   		   @@tagspec = "per"
  		end
  		@@specifier = "#{@@tagspec}_facet:"
  		puts "\nWhat tag would you like to search for?"
    	@@tagsearch = gets.chomp.gsub(/\s+/, "+")
    	@@output = @@specifier + "["+@@tagsearch.upcase+"]"
    end

    def self.clarify
		@@suggestions = []
		@@suggoutput = Hash.new(0)
    	puts "\nNo matching tags found. Did you mean one of these?"
    	RemoteSource.get(@@tagsearch).each do |story|
    		story.facets(@@tagspec).each do |facet|
    			if facet != nil
	    			facet.each do |tag|
        				@@suggestions << tag
        			end
        		end
    		end
  		end
  		@@suggestions.each do |sugg|
  			@@suggoutput[sugg] += 1
  		end
  		@@suggoutput = @@suggoutput.sort_by {|a,b| b }
  		@@suggoutput.reverse!
  		@@suggoutput.each do |key, value|
  			puts key
  		end
  		puts "\nPlease type key exactly as displayed."
  		@@tagsearch = gets.chomp.gsub(/\s+/, "+")
    	@@output = @@specifier + "["+@@tagsearch.upcase+"]"
    end

    def self.output
    	@@output
    end

end
