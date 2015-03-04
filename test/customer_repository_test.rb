require 'minitest/autorun'
require 'minitest/pride'
require './lib/customer_repository'

class CustomerRepositoryTest < Minitest::Test

  def test_it_starts_with_an_empty_array_of_customers
    customer_repository = CustomerRepository.new("path")
    assert_equal [], customer_repository.customers
  end


  def test_it_can_load_data_to_customer_
    customer_repository = CustomerRepository.new("./data/customers.csv")
    customer_repository.load_data

    assert_equal "Joey", customer_repository.customers.first.first_name
    assert_equal 1, customer_repository.customers.first.id
    assert_equal "Luettgen", customer_repository.customers[20].last_name
  end

  def test_it_can_return_all_customers
    customer_repository = CustomerRepository.new("./data/customers.csv")
    customer_repository.load_data

    refute customer_repository.customers.empty?
  end

  def test_it_can_return_random_sample
    customer_repository = CustomerRepository.new("./data/customers.csv")
    customer_repository.load_data

    assert customer_repository.random
  end

  def test_it_can_find_by_id
    customer_repository = CustomerRepository.new("./data/customers.csv")
    customer_repository.load_data
    result = customer_repository.find_by_id(4)

    assert_equal 4, result.id
  end

  def test_it_can_find_by_first_name
    customer_repository = CustomerRepository.new("./data/customers.csv")
    customer_repository.load_data
    result = customer_repository.find_by_first_name("joey")

    assert_equal "Joey", result.first_name
  end

  def test_it_can_find_by_last_name
    customer_repository = CustomerRepository.new("./data/customers.csv")
    customer_repository.load_data
    result = customer_repository.find_by_last_name("nader")

    assert_equal "Nader", result.last_name
  end

  def test_it_can_find_by_created_at
    customer_repository = CustomerRepository.new("./data/customers.csv")
    customer_repository.load_data
    result = customer_repository.find_by_created_at("2012-03-27 14:54:09 UTC")

    assert_equal "2012-03-27 14:54:09 UTC", result.created_at
  end

  def test_it_can_find_by_updated_at
    customer_repository = CustomerRepository.new("./data/customers.csv")
    customer_repository.load_data
    result = customer_repository.find_by_updated_at("2012-03-27 14:54:11 UTC")

    assert_equal "2012-03-27 14:54:11 UTC", result.updated_at
  end

  def test_it_can_find_all_by_id
    customer_repository = CustomerRepository.new("./data/customers.csv")
    customer_repository.load_data
    result = customer_repository.find_all_by_id(4)

    assert_equal 1, result.size?
  end

  def test_it_can_find_all_by_first_name
    customer_repository = CustomerRepository.new("./data/customers.csv")
    customer_repository.load_data
    result = customer_repository.find_all_by_first_name("mary")

    assert_equal 2, result.size?
  end

  def test_it_can_find_all_by_last_name
    customer_repository = CustomerRepository.new("./data/customers.csv")
    customer_repository.load_data
    result = customer_repository.find_all_by_last_name("luettgen")

    assert_equal 2, result.size?
  end

  def test_it_can_find_all_by_created_at
    customer_repository = CustomerRepository.new("./data/customers.csv")
    customer_repository.load_data
    result = customer_repository.find_all_by_created_at("2012-03-27 14:54:17 UTC")

    assert_equal 2, result.size?
  end

  def test_it_can_find_all_by_updated_at
    customer_repository = CustomerRepository.new("./data/customers.csv")
    customer_repository.load_data
    result = customer_repository.find_all_by_updated_at("2012-03-27 14:54:17 UTC")

    assert_equal 3, result.size?
  end

end
