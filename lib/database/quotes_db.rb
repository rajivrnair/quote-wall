class QuotesDatabase
	@@quotes = {:anon => 'Persistence Pays'}

	def get_quotes
		@@quotes
	end

	def add_quote(author, quote)
		@@quotes[author] = quote
	end
end