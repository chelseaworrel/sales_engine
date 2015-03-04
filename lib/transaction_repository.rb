require 'csv'
require_relative 'transaction'


class TransactionRepository
  attr_reader :transactions

  def initialize(path)
    @path = path
    @transactions = []
  end

  def opener(path)
    CSV.open(path, headers: true, header_converters: :symbol)
  end

  def load_data
    opener(@path).map do |line|
      @transactions << Transaction.new(line)
    end
  end

end

tr = TransactionRepository.new("./data/transactions.csv")


tr.load_data

tr.transactions.each do |x|
  puts x.id
end
