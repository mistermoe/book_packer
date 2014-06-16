class Book < Item
	attr_accessor :title, :author, :price, :shipping_weight, :isbn_10

	def get_weight
		book_weight = /\d+\.{1}\d+/.match(@shipping_weight).to_s.to_f
	end
end