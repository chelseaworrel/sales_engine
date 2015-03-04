require 'csv'
require_relative 'merchant'


class MerchantRepository
  attr_reader :merchants

  def initialize(path)
    @path = path
    @merchants = []
  end

  def opener(path)
    CSV.open(path, headers: true, header_converters: :symbol)
  end

  def load_data
    opener(@path).map do |line|
      @merchants << Merchant.new(line)
    end
  end

end

mr = MerchantRepository.new("./data/merchants.csv")


mr.load_data

puts mr.merchants

mr.merchants.each do |x|
  puts x.name
end
