class Quote
	@@db = {:anon => 'Persistence Pays'}

	def get_quotes
		@@db
	end

	def add_quote(author, quote)
		@@db[author] = quote
	end
end