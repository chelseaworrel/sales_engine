require 'csv'
require_relative 'invoice_item'


class InvoiceItemRepository
  attr_reader :invoice_items

  def initialize(path)
    @path = path
    @invoice_items = []
  end

  def opener(path)
    CSV.open(path, headers: true, header_converters: :symbol)
  end

  def load_data
    opener(@path).map do |line|
      @invoice_items << InvoiceItem.new(line)
    end
  end

end

ir = InvoiceItemRepository.new("./data/invoice_items.csv")


 ir.load_data

 puts ir.invoice_items.first.item_id

# ir.invoices.each do |x|
#   puts x.merchant_id
# end
