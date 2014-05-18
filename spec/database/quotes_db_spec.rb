require_relative '../../lib/database/quotes_db.rb'

describe QuotesDatabase, "#get_quotes" do
	it "gets all quotes" do
		expect(QuotesDatabase.new.get_quotes).to eql({:anon => "Persistence Pays"})
	end
end

describe QuotesDatabase, "#add_quote" do
	it "adds a quote" do
		quotes_db = QuotesDatabase.new
		quotes_db.add_quote(:me, "sup yo?")

		expect(quotes_db.get_quotes).to eql({:anon => "Persistence Pays", :me => "sup yo?"})
	end
end