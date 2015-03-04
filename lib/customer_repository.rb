require 'csv'
require_relative 'customer'


class CustomerRepository
  attr_reader :customers, :sales_engine

  def initialize(path, sales_engine)
    @path = path
    @customers = []
    @sales_engine = sales_engine
  end

  def load_data
    file = CSV.open(@path, headers: true, header_converters: :symbol)
    file.map do |line|
      @customers << Customer.new(line, self)
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
