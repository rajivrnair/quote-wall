require_relative '../lib/application'
require 'rspec_api_documentation'
require 'json_spec'

RspecApiDocumentation.configure do |config|
  #config.app = Webmachine::Adapters::WEBrick::Server.new(App.dispatcher, {:Port => "8080"})
  config.app = Webmachine::Adapters::Rack.new(App.configuration, App.dispatcher)
end
 
RSpec.configure do |config|
  config.include JsonSpec::Helpers
 
  config.before do
    Quote.annihilate

    Quote.new(
	:author => "Anon", 
	:date => Date.new, 
	:quote =>"The light at the end of the tunnel might just be an oncoming train."
	).save
  end
end