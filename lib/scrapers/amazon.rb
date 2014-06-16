module Scraper
  class Amazon
      attr_accessor :page
    def initialize(page)

      @page = Nokogiri::HTML(open(page))
    end
    def get_title(selector)
      title = @page.css(selector).text
    end

    def get_author
      author = page.css(".buying").css("span").css("a").children.first.text
      # \[{1}.+\] REGEX TO FIND AUTHOR IN META TAG
      # /\[{1}.+\]/.match(page.css('meta')[1].attributes["content"].value).to_s
    end

    def get_price
      price = page.css(".priceLarge").text
    end

    def get_isbn_10
      isbn_10 = page.css('.p13n-session').first.attributes["data-pageid"].value
    end

    def get_shipping_weight
      nodes = page.css('b')
      shipping_weight_text = nodes.find {|node| node.text == "Shipping Weight:"}.parent.text
      shipping_weight = /\d+\.{1}\d+\s(pounds)/.match(shipping_weight_text).to_s
    end

  end
end
