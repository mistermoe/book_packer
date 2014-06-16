require 'spec_helper'
describe DataFormatter::BookBoxer do
	it 'exists' do
	  expect(described_class).to be_a(Class)
	end

	# it 'fetches unformatted data' do
	# 	book_data = []
	# 	for i in (1..10)
	# 		book_data << "data/book#{i}.html"
	# 	end
	#   unformatted_data = DataFormatter::BookBoxer.fetch_data(book_data)
	# end

	it 'scrapes books' do
	  book_data = []
		for i in (1..20)
			book_data << "data/book#{i}.html"
		end
		books = described_class.scrape_books(book_data)
		expect(books).to be_a(Array)
		expect(books.first.title).to eq('Zealot: The Life and Times of Jesus of Nazareth [Hardcover]')
		expect(books.count).to eq(20)
	end

	it 'packs books' do
		books = [
		  book1 = Book.new(title: "Butch Dialoges", author: "Becky Beavertail", isbn_10: "123456789", price: "$10.00", shipping_weight: "1.2 pounds"),
		  book2 = Book.new(title: "Vacuuming: Best Practices", author: "Becky Beavertail", isbn_10: "123456789", price: "$10.00", shipping_weight: "3.2 pounds"),
		  book3 = Book.new(title: "Dish Soap Addiction", author: "Vernon McGillaCutti", isbn_10: "123456789", price: "$10.00", shipping_weight: "6.4 pounds"),
		  book4 = Book.new(title: "Nicholas Cage vs. Shaquiel O'Neil (abridged)", author: "Becky Beavertail", isbn_10: "123456789", price: "$10.00", shipping_weight: "2.2 pounds"),
		  book5 = Book.new(title: "Swiffing Anti Patterns", author: "Martha Stewart", isbn_10: "123456789", price: "$10.00", shipping_weight: "3.6 pounds"),
		  book6 = Book.new(title: "Clifford the Big Red Dog (an autobiography)", author: "Clifford", isbn_10: "123456789", price: "$10.00", shipping_weight: "4.4 pounds"),
		  book7 = Book.new(title: "A", author: "AA", isbn_10: "123456789", price: "$10.00", shipping_weight: "1.4 pounds"),
		  book8 = Book.new(title: "B", author: "BB", isbn_10: "123456789", price: "$10.00", shipping_weight: "1.4 pounds"),
		  book9 = Book.new(title: "C", author: "CC", isbn_10: "123456789", price: "$10.00", shipping_weight: "5.6 pounds"),
		  book10 = Book.new(title: "C", author: "CC", isbn_10: "123456789", price: "$10.00", shipping_weight: "4.1 pounds"),
		  book11 = Book.new(title: "D", author: "DD", isbn_10: "123456789", price: "$10.00", shipping_weight: "7.8 pounds"),
		  book12 = Book.new(title: "D", author: "DD", isbn_10: "123456789", price: "$10.00", shipping_weight: "2.6 pounds"),
		  book13 = Book.new(title: "D", author: "DD", isbn_10: "123456789", price: "$10.00", shipping_weight: "2.8 pounds"),
		  book14 = Book.new(title: "D", author: "DD", isbn_10: "123456789", price: "$10.00", shipping_weight: "7.6 pounds"),
		  book15 = Book.new(title: "D", author: "DD", isbn_10: "123456789", price: "$10.00", shipping_weight: "2.2 pounds"),
		  book16 = Book.new(title: "D", author: "DD", isbn_10: "123456789", price: "$10.00", shipping_weight: "9.4 pounds"),
		  book17 = Book.new(title: "D", author: "DD", isbn_10: "123456789", price: "$10.00", shipping_weight: "8.8 pounds"),
		  book18 = Book.new(title: "D", author: "DD", isbn_10: "123456789", price: "$10.00", shipping_weight: "1.4 pounds"),
		  book19 = Book.new(title: "D", author: "DD", isbn_10: "123456789", price: "$10.00", shipping_weight: "3.6 pounds"),
		  book20 = Book.new(title: "D", author: "DD", isbn_10: "123456789", price: "$10.00", shipping_weight: "4.9 pounds")


		]

		boxes = described_class.pack_books(books)
		expect(boxes.count).to be <= 20
	end
end