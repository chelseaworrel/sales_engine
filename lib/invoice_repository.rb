require 'csv'
require_relative 'invoice'


class InvoiceRepository
  attr_reader :invoices

  def initialize(path)
    @path = path
    @invoices = []
  end

  def opener(path)
    CSV.open(path, headers: true, header_converters: :symbol)
  end

  def load_data
    opener(@path).map do |line|
      @invoices << Invoice.new(line)
    end
  end

end

ir = InvoiceRepository.new("./data/invoices.csv")


 ir.load_data

 puts ir.invoices.first.merchant_id

# ir.invoices.each do |x|
#   puts x.merchant_id
# end
