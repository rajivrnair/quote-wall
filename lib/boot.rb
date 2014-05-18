require_relative "application"

# bootstrap data
Quote.new(
	:author => "Raghu Racer", 
	:date => Date.new, 
	:quote =>"Agile is not doing the first dumb thing that pops into your head."
	).save

App.run