class Quote
	attr_accessor :id, :author, :quote, :date

	@@db = {}

	class << self
		def all
			@@db.values
		end

		def find(id)
			@@db[id]
		end

		def next_id
			@@db.keys.max.to_i + 1
		end

		def annihilate
			@@db.clear
		end
	end

	def to_json(options = {})
		%{{"author":"#@author", "quote":"#@quote", "date":"#@date", "id":#@id}}
	end

	def initialize(attrs = {})
		attrs.each do |attr, value|
			send("#{attr}=", value) if respond_to?(attr)
		end
	end

	def save(id = nil)
		self.id = id || self.class.next_id
		@@db[self.id] = self
	end

	def destroy
		@@db.delete(id)
	end	

end