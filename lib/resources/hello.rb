require 'webmachine'
class HelloResource < Webmachine::Resource
	def allowed_methods
	    %w(GET)
	end

	def content_types_provided
		[["application/json", :to_json]]
	end

	def to_json
		'{ "message" : "hello" }'
	end
end