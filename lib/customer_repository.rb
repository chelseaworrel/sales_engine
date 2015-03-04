require 'csv'
require_relative 'customer'


class CustomerRepository
  attr_reader :customers

  def initialize(path)
    @path = path
    @customers = []
  end

  def load_data
    file = CSV.open(@path, headers: true, header_converters: :symbol)
    file.map do |line|
      @customers << Customer.new(line)
    end
    file.close
  end

  def all
    @customers
  end

  def random
    @customers.sample
  end

  def find_by_id(id)
    @customers.find do |customer|
       customer.id == id
     end
  end

end

cr = CustomerRepository.new("./data/customers.csv")


cr.load_data

cr.find_by_id(4)


#puts cr.customers.first.inspect

# cr.customers.each do |x|
#   puts x.first_name
# end
