require 'spec_helper'
describe Scraper::Amazon do
  it 'exists' do
    expect(described_class).to be_a(Class)
  end

  before do
    @scraper = Scraper::Amazon.new('data/book1.html')
  end
  it 'gets the title of an item from an amazon page' do

    title = @scraper.get_title
    expect(title).to eq("Zealot: The Life and Times of Jesus of Nazareth [Hardcover]")
    expect(title).to be_a(String)
  end
  it 'gets the author of a book from an amazon page' do
    author = @scraper.get_author
    expect(author).to eq("Reza Aslan")

    @scraper.page = Nokogiri::HTML(open('data/book2.html'))
    author2 = @scraper.get_author
    
    expect(author2).to eq("David S Cohen")

    @scraper.page = Nokogiri::HTML(open('data/book3.html'))
    author3 = @scraper.get_author
    expect(author3).to eq("Jenni Rivera")
  end

  it 'gets the price from an amazon page' do
    price = @scraper.get_price
    expect(price).to eq("$16.89")

    @scraper.page = Nokogiri::HTML(open('data/book2.html'))
    price2 = @scraper.get_price
    expect(price2).to eq("$27.83")

    @scraper.page = Nokogiri::HTML(open('data/book3.html'))
    price2 = @scraper.get_price
    expect(price2).to eq("$10.18")

    @scraper.page = Nokogiri::HTML(open('data/book17.html'))
    price3 = @scraper.get_price
    expect(price3).to eq("$8.97")
  end

  it 'gets the ISBN-10 from an amazon page' do
    isbn_10 = @scraper.get_isbn_10
    expect(isbn_10).to eq("140006922X")

    @scraper.page = Nokogiri::HTML(open('data/book2.html'))
    isbn_10_2 = @scraper.get_isbn_10
    expect(isbn_10_2).to eq("1608871827")

    @scraper.page = Nokogiri::HTML(open('data/book3.html'))
    isbn_10_3 = @scraper.get_isbn_10
    expect(isbn_10_3).to eq("1476745420")

    @scraper.page = Nokogiri::HTML(open('data/book17.html'))
    isbn_10_4 = @scraper.get_isbn_10
    expect(isbn_10_4).to eq("147780630X")
  end

  it 'gets the shipping weight from an amazon page' do
    shipping_weight = @scraper.get_shipping_weight
    expect(shipping_weight).to eq("1.2 pounds")

    @scraper.page = Nokogiri::HTML(open('data/book2.html'))
    shipping_weight2 = @scraper.get_shipping_weight
    expect(shipping_weight2).to eq("3.2 pounds")

    @scraper.page = Nokogiri::HTML(open('data/book3.html'))
    shipping_weight2 = @scraper.get_shipping_weight
    expect(shipping_weight2).to eq("6.4 pounds")

    @scraper.page = Nokogiri::HTML(open('data/book17.html'))
    shipping_weight3 = @scraper.get_shipping_weight
    expect(shipping_weight3).to eq("8.8 pounds")
  end
end
