require_relative 'base'
require_relative '../models/quote'

class QuotesResource < JsonResource

	def allowed_methods
	    %w(GET POST)
	end

	def to_json
		{
			:quotes => Quote.all
		}.to_json
	end

	# called for every post. True if it is a create req. False if this is a normal (form?) post. 
	def post_is_create?
		true
	end

	# Called if post_is_create is true
	def create_path
		@id = Quote.next_id
		"/orders/#@id"
	end

	# Called if post_is_create is true
	def process_post
		raise "Ehh, What's up Doc?"
	end

	private
	# called after create_path
	def from_json
		order = Quote.new(params).save(@id)
	end	

=begin
	def trace?
    	true
	end
=end
end