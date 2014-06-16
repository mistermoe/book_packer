class Box < Item
	attr_accessor :books, :weight

	def initialize(params={})
		@books = []
		super
	end

	def add_book(book)
		@books << book 
		book_weight = /\d+\.{1}\d+/.match(book.shipping_weight).to_s.to_f
		if !@weight
			@weight = book_weight
		else
			@weight += book_weight
		end
	end
end