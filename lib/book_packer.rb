require 'nokogiri'
require 'open-uri'
require 'json'
require 'pry-debugger'


require_relative 'items/item.rb'
require_relative 'items/book.rb'
require_relative 'items/box.rb'

require_relative 'scrapers/amazon.rb'


require_relative 'data_formatters/book_boxer.rb'