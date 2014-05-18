require 'webmachine'
require 'webmachine/adapters/rack'
require_relative 'resources/hello'
require_relative 'resources/quotes'
require_relative 'resources/quote'

App = Webmachine::Application.new do |app|
	app.routes do
		add ['trace', '*'], Webmachine::Trace::TraceResource
		add ['quotes'], QuotesResource
		add ['quotes', :id], QuoteResource
		add ['hello'], HelloResource
	end
end