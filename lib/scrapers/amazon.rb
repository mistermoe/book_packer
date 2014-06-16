module Scraper
  class Amazon
      attr_accessor :page
    def initialize(page)

      @page = Nokogiri::HTML(open(page))
    end
    def get_title
      title = @page.css("#btAsinTitle").text
    end

    def get_author
      author_text = /\[{1}.+\]/.match(page.css('meta')[1].attributes["content"].value).to_s
      author = author_text[1...author_text.length - 1]
      if author.include? ","
        author = author.split(",")[0]
      end
      return author
    end

    def get_price
      price = page.css(".priceLarge").text
    end

    def get_isbn_10
      nodes = page.css('b')
      isbn_10 = nodes.find {|node| node.text == "ISBN-10:"}.next_sibling.text.lstrip
    end

    def get_shipping_weight
      nodes = page.css('b')
      shipping_weight_text = nodes.find {|node| node.text == "Shipping Weight:"}.parent.text
      shipping_weight = /\d+\.{1}\d+\s(pounds)/.match(shipping_weight_text).to_s
    end

  end
end
