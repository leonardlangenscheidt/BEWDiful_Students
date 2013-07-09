require 'json'
require 'rest-client'
require_relative 'story'

class RemoteSource
  def self.get(search)
  	query = "query=" + search
	url = "http://api.nytimes.com/svc/search/v1/article?#{query}&fields=title,des_facet,geo_facet,org_facet,per_facet&api-key=904f00350b09ae7971d92692acefbd7f:16:67855776"
	res = JSON.load(RestClient.get(url))
    res["results"].map do |story|
    	title = story["title"]
    	categories = [].push(story["des_facet"]).join(", ").capitalize
    	des_facets = [].push(story["des_facet"])
    	geo_facets = [].push(story["geo_facet"])
    	org_facets = [].push(story["org_facet"])
    	per_facets = [].push(story["per_facet"])
      	Story.new  title, categories, des_facets, geo_facets, org_facets, per_facets
    end
  end
end
