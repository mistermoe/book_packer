class Box < Item
	attr_accessor :books, :weight

	def initialize
		@books = []
		@weight = 0.0
	end

	def add_book(book)
		@books << book 
		book_weight = /\d+\.{1}\d+/.match(book.shipping_weight).to_s.to_f
		@weight += book_weight
	end
end