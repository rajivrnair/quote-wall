require_relative '../../lib/models/quote.rb'

describe Quote, "#get_quotes" do
	it "gets all quotes" do
		expect(Quote.new.get_quotes).to eql({:anon => "Persistence Pays"})
	end
end

describe Quote, "#add_quote" do
	it "adds a quote" do
		quote = Quote.new
		quote.add_quote(:me, "sup yo?")

		expect(quote.get_quotes).to eql({:anon => "Persistence Pays", :me => "sup yo?"})
	end
end