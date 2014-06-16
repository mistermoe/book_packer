require 'spec_helper'

describe "Box" do
	before do
		@box = Box.new
	end
	it 'initializes with books as an empty array' do
	  expect(@box.books).to be_a(Array)
	  expect(@box.books.count).to eq(0)
	end

	it 'adds a book to the box and adjusts the weight accordingly' do
	  book = Book.new(title: "Oscar Meyer Wieners", shipping_weight: "2.26 pounds")
	  @box.add_book(book)
	  expect(@box.books.first.title).to eq("Oscar Meyer Wieners")
	  expect(@box.books.count).to eq(1)
	  expect(@box.weight).to eq(2.26)

	end
end