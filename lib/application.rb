require 'webmachine'
require_relative 'resources/hello'
require_relative 'resources/quotes'
require_relative 'resources/quote'

App = Webmachine.application.routes do
	add ['trace', '*'], Webmachine::Trace::TraceResource
 	add ['quotes'], QuotesResource
 	add ['quotes', :id], QuoteResource
 	add ['hello'], HelloResource
end