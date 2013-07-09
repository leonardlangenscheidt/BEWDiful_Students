class Story
	def initialize(title, category, des_facets, geo_facets, org_facets, per_facets)
		@title = title
		@category = category
		@des_facets = des_facets
		@geo_facets = geo_facets
		@org_facets = org_facets
		@per_facets = per_facets
	end
	def title
		@title
	end
	def category
		@category
	end
	def facets(tagspec)
		if tagspec == "des"
			@des_facets
		elsif tagspec == "geo"
			@geo_facets
		elsif tagspec == "org"
			@org_facets
		elsif tagspec == "per"
			@per_facets
		end
	end
end
