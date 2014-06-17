class Box < Item
	attr_accessor :id, :weight, :books

	# used to generate box id
	@@box_counter = 0

	def initialize
		@books = []
		@weight = 0.0
		@id = @@box_counter += 1
	end

	def add_book(book, weight)
		@books << book
		book_weight = /\d+\.{1}\d+/.match(weight).to_s.to_f.round(2)
		@weight += book_weight
	end
end
