require 'csv'
require_relative 'customer'


class CustomerRepository
  attr_reader :customers, :sales_engine

  def initialize(sales_engine)
    @customers = []
    @sales_engine = sales_engine
  end

  def load_data(path)
    file = CSV.open(path, headers: true, header_converters: :symbol)
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

  def find_by_first_name(first_name)
    @customers.find do |customer|
       customer.first_name.downcase == first_name.downcase
    end
  end

  def find_by_last_name(last_name)
    @customers.find do |customer|
       customer.last_name.downcase == last_name.downcase
    end
  end

  def find_by_created_at(created_at)
    @customers.find do |customer|
       customer.created_at == created_at
    end
  end

  def find_by_updated_at(updated_at)
    @customers.find do |customer|
       customer.updated_at == updated_at
    end
  end

  def find_all_by_id(id)
    @customers.find_all do |customer|
      customer.id == id
    end
  end

  def find_all_by_first_name(first_name)
    @customers.find_all do |customer|
      customer.first_name.downcase == first_name.downcase
    end
  end

  def find_all_by_last_name(last_name)
    @customers.find_all do |customer|
      customer.last_name.downcase == last_name.downcase
    end
  end

  def find_all_by_created_at(created_at)
    @customers.find_all do |customer|
      customer.created_at == created_at
    end
  end

  def find_all_by_updated_at(updated_at)
    @customers.find_all do |customer|
      customer.updated_at == updated_at
    end
  end
end
