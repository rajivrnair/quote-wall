require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource "Quotes" do
	header "Accept", "application/json"
	header "Content-Type", "application/json"

	get "/quotes" do
		example "Getting all quotes" do
			do_request

			response_body.should be_json_eql({
			:quotes => [
				{
					:author => "Anon",
					:quote => "The light at the end of the tunnel might just be an oncoming train."
				}
			]
			}.to_json).excluding("date")

			status.should == 200
		end
	end

	post "/quotes" do
		parameter :author, "Author"
		parameter :quote, "Quote"

		let(:author) { "Bugs Bunny" }
		let(:quote ) { "What's up Doc?" }

		let(:raw_post) { params.to_json }

		example "Creating a quote" do
			do_request

			response_body.should == ""
			response_headers["Location"].should =~ /\/quotes\/2$/

			status.should == 201
		end
	end

	get "/quotes/:id" do
		let(:id) { Quote.all.first.id }

		example "Viewing a single quote" do
			do_request

			response_body.should be_json_eql({
				:author => "Anon",
				:quote => "The light at the end of the tunnel might just be an oncoming train."
			}.to_json).excluding("date")

			status.should == 200
		end
	end

	delete "/quotes/:id" do
		let(:id) { Quote.all.first.id }

		example "Deleting a quote" do
			do_request

			response_body.should == ""

			status.should == 204
		end
	end

	put "/quotes/:id" do
		parameter :author, "Author"
		parameter :quote, "Quote"

		let(:quote_one) { Quote.all.first }
		let(:id) { quote_one.id }

		let(:author) { "Julius Caesar" }
		let(:quote) { "Alea iacta est" }

		let(:raw_post) { params.to_json }

		example "Updating a quote" do
			do_request

			response_body.should == ""

			status.should == 204

			client.get("/quotes/#{id}")

			response_body.should be_json_eql({
				:author => "Julius Caesar",
				:quote => "Alea iacta est"
			}.to_json).excluding("date")

			status.should == 200
		end
	end

end
