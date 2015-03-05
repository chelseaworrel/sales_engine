require_relative 'test_helper'
require './lib/merchant_repository'

class MerchantRepositoryTest < Minitest::Test

  def test_it_starts_with_an_empty_array_of_merchants
    merchant_repository = MerchantRepository.new(nil)
    assert_equal [], merchant_repository.merchants
  end


  def test_it_can_load_data_to_merchant
    merchant_repository = MerchantRepository.new(nil)
    merchant_repository.load_data("./data/merchants.csv")

    assert_equal "Schroeder-Jerde", merchant_repository.merchants.first.name
    assert_equal 1, merchant_repository.merchants.first.id
    assert_equal "Leffler, Rice and Leuschke", merchant_repository.merchants[20].name
  end

  def test_it_can_return_all_merchants
    merchant_repository = MerchantRepository.new(nil)
    merchant_repository.load_data("./data/merchants.csv")

    refute merchant_repository.merchants.empty?
  end

  def test_it_can_return_random_sample
    merchant_repository = MerchantRepository.new(nil)
    merchant_repository.load_data("./data/merchants.csv")

    assert merchant_repository.random
  end

  def test_it_can_find_by_id
    merchant_repository = MerchantRepository.new(nil)
    merchant_repository.load_data("./data/merchants.csv")
    result = merchant_repository.find_by_id(4)

    assert_equal 4, result.id
  end

  def test_it_can_find_by_name
    merchant_repository = MerchantRepository.new(nil)
    merchant_repository.load_data("./data/merchants.csv")
    result = merchant_repository.find_by_name("Kozey Group")

    assert_equal "Kozey Group", result.name
  end

  def test_it_can_find_by_created_at
    merchant_repository = MerchantRepository.new(nil)
    merchant_repository.load_data("./data/merchants.csv")
    result = merchant_repository.find_by_created_at("2012-03-27 14:53:59 UTC")

    assert_equal "2012-03-27 14:53:59 UTC", result.created_at
  end

  def test_it_can_find_by_updated_at
    merchant_repository = MerchantRepository.new(nil)
    merchant_repository.load_data("./data/merchants.csv")
    result = merchant_repository.find_by_updated_at("2012-03-27 14:53:59 UTC")

    assert_equal "2012-03-27 14:53:59 UTC", result.updated_at
  end

  def test_it_can_find_all_by_id
    merchant_repository = MerchantRepository.new(nil)
    merchant_repository.load_data("./data/merchants.csv")
    result = merchant_repository.find_all_by_id(4)

    assert_equal 1, result.count
  end

  def test_it_can_find_all_by_name
    merchant_repository = MerchantRepository.new(nil)
    merchant_repository.load_data("./data/merchants.csv")
    result = merchant_repository.find_all_by_name("Brown Inc")

    assert_equal 1, result.count
  end

  def test_it_can_find_all_by_created_at
    merchant_repository = MerchantRepository.new(nil)
    merchant_repository.load_data("./data/merchants.csv")
    result = merchant_repository.find_all_by_created_at("2012-03-27 14:53:59 UTC")

    assert_equal 9, result.count
  end

  def test_it_can_find_all_by_updated_at
    merchant_repository = MerchantRepository.new(nil)
    merchant_repository.load_data("./data/merchants.csv")
    result = merchant_repository.find_all_by_updated_at("2012-03-27 14:53:59 UTC")

    assert_equal 8, result.count
  end

end
