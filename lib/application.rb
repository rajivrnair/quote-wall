require 'webmachine'
require_relative 'resources/hello'
require_relative 'resources/quotes'

Webmachine.application.routes do
	add ['trace', '*'], Webmachine::Trace::TraceResource
 	add ['quotes'], QuotesResource
 	add ['hello'], HelloResource
end

Webmachine.application.run