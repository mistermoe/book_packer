require_relative 'lib/book_packer.rb'

data = []

for i in(1..20)
  data << "data/book#{i}.html"
end

DataFormatter::BookBoxer.run(data)
