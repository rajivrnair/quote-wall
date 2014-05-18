require_relative 'base'
require_relative '../models/quote'

class QuotesResource < JsonResource

	def allowed_methods
	    %w(GET POST)
	end

	def to_json
		''.to_json
	end

=begin
	def trace?
    	true
	end
=end
end