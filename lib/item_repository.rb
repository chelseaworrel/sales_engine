require 'csv'
require_relative 'item'


class ItemRepository
  attr_reader :items

  def initialize(path)
    @path = path
    @items = []
  end

  def opener(path)
    CSV.open(path, headers: true, header_converters: :symbol)
  end

  def load_data
    opener(@path).map do |line|
      @items << Item.new(line)
    end
  end

end

ir = ItemRepository.new("./data/items.csv")

ir.load_data

puts ir.items[9].unit_price

# ir.customers.each do |x|
#   puts x.description
# end
