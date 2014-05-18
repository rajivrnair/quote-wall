require_relative 'base'
require_relative '../models/quote'

class QuoteResource < JsonResource

	def allowed_methods
	    %w(GET PUT DELETE)
	end

	def id
		request.path_info[:id].to_i
	end

	# GET request
	def to_json
		Quote.find(id).to_json
	end

	# called for a DELETE request
	def delete_resource
		Quote.find(id).destroy
		true
	end

	private
	def from_json
		quote = Quote.new(params).save(id)
	end

=begin
	def trace?
    	true
	end
=end
end