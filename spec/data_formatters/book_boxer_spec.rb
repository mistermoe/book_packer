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
end