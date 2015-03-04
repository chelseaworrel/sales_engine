require 'minitest/autorun'
require 'minitest/pride'
require './lib/merchant_repository'

class MerchantRepositoryTest < Minitest::Test

  def test_it_can_take_a_path_when_initialized
    skip
    merchant_repository = MerchantRepository.new("path")
    assert_equal "path", merchant_repository.path
  end

  def test_it_starts_with_an_empty_array_of_customers
    merchant_repository = MerchantRepository.new("path")
    assert_equal [], merchant_repository.merchants
  end

  def test_it_can_open_a_CSV_file
    skip
    merchant_repository = MerchantRepository.new("path")
    $stdout = StringIO.new
    file_open = merchant_repository.opener("./data/merchants.csv")
    assert file_open.include?("id")
  end

  def test_it_can_load_data_to_customer
    skip
    merchant_repository = MerchantRepository.new("./data/merchants.csv")
    merchants = []
    merchant_repository.load_data

    assert_equal "Schroeder-Jerde", customers.first.name
  end

end
