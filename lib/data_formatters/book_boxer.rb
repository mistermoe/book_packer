module DataFormatter
	class BookBoxer
		def self.run(data)
			books = scrape_books(data)

			boxes = pack_books(books)

			boxes_hash = as_hash(boxes)

			boxes_json = JSON.pretty_generate(boxes_hash)

			return boxes_json
		end

		def self.scrape_books(data)
			books = []

			data.each do |datum|
				params = {}
				scraper = Scraper::Amazon.new(datum)
				params[:title] = scraper.get_title
				params[:author] = scraper.get_author
				params[:price] = scraper.get_price
				params[:isbn_10] = scraper.get_isbn_10
				params[:shipping_weight] = scraper.get_shipping_weight

				book = Book.new(params)
				books << book

			end

			return books
		end

		def self.pack_books(books)
			boxes = [Box.new]
			sorted_books = books.sort_by{|book| -book.get_weight}
			sorted_books.each do |book|
				if boxes.last.weight + book.get_weight >= 10
					boxes << Box.new
				end
				boxes.last.add_book(book.as_hash, book.shipping_weight)
			end
			return boxes
		end

		def self.as_hash(boxes)
			boxes_hash = {}
			for i in (0...boxes.length)
				boxes_hash[i] = boxes[i].as_hash
			end
			return boxes_hash
		end
	end
end
