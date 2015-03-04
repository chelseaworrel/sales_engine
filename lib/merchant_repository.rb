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

  def all
    merchants
  end

  def random
    merchants.sample
  end

  def find_by_id(id_given)
    @merchants.find do |merchant|
      merchant.id == id_given
    end
    merchant
  end

  def find_by_name(name_given)
    @merchants.find do |merchant|
      merchant.name.downcase == name_given.downcase
    end
  end

  def find_by_created_at(date_given)
    @merchants.find do |merchant|
      merchant.date_created
  end

end

mr = MerchantRepository.new("./data/merchants.csv")


mr.load_data

puts mr.find_by_id(4).inspect
puts mr.find_by_name("williamson Group").inspect

# mr.merchants.each do |x|
#   x
# end
