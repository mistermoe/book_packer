require 'spec_helper'

describe "Book" do
	it 'returns the weight of a book as a float' do
	  book = Book.new(title: "Swiffing Anti Patterns", author: "Martha Stewart", isbn_10: "123456789", price: "$10.00", shipping_weight: "3.6 pounds")
	  expect(book.get_weight).to eq(3.6)
	end
end