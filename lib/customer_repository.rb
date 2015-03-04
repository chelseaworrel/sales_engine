require 'csv'
require_relative 'customer'


class CustomerRepository
  attr_reader :customers

  def initialize(path)
    @path = path
    @customers = []
  end

  def opener(path)
    CSV.open(path, headers: true, header_converters: :symbol)
  end

  def load_data
    opener(@path).map do |line|
      @customers << Customer.new(line)
    end
  end

end

cr = CustomerRepository.new("./data/customers.csv")


cr.load_data

puts cr.customers

cr.customers.each do |x|
  puts x.first_name
end
