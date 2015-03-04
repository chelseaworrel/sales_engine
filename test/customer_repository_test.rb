require 'minitest/autorun'
require 'minitest/pride'
require './lib/customer_repository'

class CustomerRepositoryTest < Minitest::Test

  def test_it_can_take_a_path_when_initialized
    skip
    customer_repository = CustomerRepository.new("path")
    assert_equal "path", customer_repository.path
  end

  def test_it_starts_with_an_empty_array_of_customers
    customer_repository = CustomerRepository.new("path")
    assert_equal [], customer_repository.customers
  end

  def test_it_can_open_a_CSV_file
    skip
    customer_repository = CustomerRepository.new("./data/customers.csv")
    $stdout = StringIO.new
    file_open = customer_repository.opener("./data/customers.csv")
    assert file_open.include?("id")
  end

  def test_it_can_load_data_to_customer
    skip
    customer_repository = CustomerRepository.new("./data/customers.csv")
    customers = []
    customer_repository.load_data

    assert_equal "Joey", customers.first.first_name
  end

end
