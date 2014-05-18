require_relative '../../lib/models/quote.rb'

describe Quote, "Testing instance methods" do

	it "#save - adds a quote" do
		expect(Quote.find(1).author).to eql("Anon")
	end

	it "#destroy - removes a quote" do
		@new_quote = Quote.new({"author" => "me", "quote" => "sup yo?", "date" => "2014-05-18"}).save

		@new_quote.destroy

		expect(Quote.find(2)).to be_nil
	end
end

describe Quote, "Testing class methods" do
	before(:all) do
		Quote.annihilate
	end

	it "#all - gets all quotes" do
		Quote.new({"author" => "anon1", "quote" => "Persistence Pays1", "date" => "2014-05-18"}).save
		Quote.new({"author" => "anon2", "quote" => "Persistence Pays2", "date" => "2014-05-18"}).save

		expect(Quote.all.length).to eql(3)
	end

	it "#annihilate - clears all quotes" do
		Quote.new({"author" => "anon1", "quote" => "Persistence Pays1", "date" => "2014-05-18"}).save
		Quote.new({"author" => "anon2", "quote" => "Persistence Pays2", "date" => "2014-05-18"}).save
		Quote.new({"author" => "anon3", "quote" => "Persistence Pays3", "date" => "2014-05-18"}).save
		expect(Quote.all.length).to be > 0
		
		Quote.annihilate

		expect(Quote.all.length).to eql(0)
	end

	it "#find - gets the quote by id" do
		new_quote = Quote.new({"author" => "anon100", "quote" => "Persistence Pays100", "date" => "2014-05-18"})
		new_quote.save(100)
		
		looked_up_quote = Quote.find(100)

		expect(looked_up_quote).not_to eql(nil)
		expect(looked_up_quote).to eql(new_quote)
	end

	it "#next_id - gets the next quote id in sequence" do
		new_quote = Quote.new({"author" => "anon100", "quote" => "Persistence Pays100", "date" => "2014-05-18"})
		new_quote.save(1000)
	
		next_id = Quote.next_id
		expect(next_id).to eql(1001)
	end
end