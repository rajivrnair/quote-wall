require 'webmachine'
require 'json'
require_relative '../models/quote'

class QuotesResource < Webmachine::Resource
	def initialize
		@quotes_db = QuotesDatabase.new
	end

	def allowed_methods
	    %w(GET POST)
	end

	def content_types_provided
		[["application/json", :to_json]]
	end

	def to_json
		@quotes_db.get_quotes.to_json
	end

=begin
	def trace?
    	true
	end
=end
end