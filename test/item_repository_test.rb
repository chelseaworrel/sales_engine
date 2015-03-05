require './test/test_helper'
require './lib/item_repository'

class ItemRepositoryTest < Minitest::Test

  def test_it_starts_with_an_empty_array_of_items
    item_repository = ItemRepository.new(nil)
    assert_equal [], item_repository.items
  end

  def test_it_can_load_data_to_items
    item_repository = ItemRepository.new(nil)
    item_repository.load_data("./data/items.csv")

    assert_equal "Item Qui Esse", item_repository.items.first.name
    assert_equal 1, item_repository.items.first.id
    assert_equal 68723, item_repository.items[4].unit_price
  end

  def test_it_can_return_all_items
    item_repository = ItemRepository.new(nil)
    item_repository.load_data("./data/items.csv")

    refute item_repository.items.empty?
  end

  def test_it_can_return_random_sample
    item_repository = ItemRepository.new(nil)
    item_repository.load_data("./data/items.csv")

    assert item_repository.random
  end

  def test_it_can_find_by_id
    item_repository = ItemRepository.new(nil)
    item_repository.load_data("./data/items.csv")
    result = item_repository.find_by_id(4)

    assert_equal 4, result.id
  end

  def test_it_can_find_by_name
    item_repository = ItemRepository.new(nil)
    item_repository.load_data("./data/items.csv")
    result = item_repository.find_by_name("Item Provident At")

    assert_equal "Item Provident At", result.name
  end

  def test_it_can_find_by_description
    item_repository = ItemRepository.new(nil)
    item_repository.load_data("./data/items.csv")
    result = item_repository.find_by_description("Repellat quaerat ab. Enim autem quas sapiente ut sed. Dolores vel sint.")

    assert result.description.include?("Repellat quaerat ab.")
  end

  def test_it_can_find_by_unit_price
    item_repository = ItemRepository.new(nil)
    item_repository.load_data("./data/items.csv")
    result = item_repository.find_by_unit_price(39862)

    assert_equal 39862, result.unit_price
  end

  def test_it_can_find_by_merchant_id
    item_repository = ItemRepository.new(nil)
    item_repository.load_data("./data/items.csv")
    result = item_repository.find_by_merchant_id(9)

    assert_equal 9, result.merchant_id
  end

  def test_it_can_find_by_created_at
    item_repository = ItemRepository.new(nil)
    item_repository.load_data("./data/items.csv")
    result = item_repository.find_by_created_at("2012-03-27 14:53:59 UTC")

    assert_equal "2012-03-27 14:53:59 UTC", result.created_at
  end

  def test_it_can_find_by_updated_at
    item_repository = ItemRepository.new(nil)
    item_repository.load_data("./data/items.csv")
    result = item_repository.find_by_updated_at("2012-03-27 14:53:59 UTC")

    assert_equal "2012-03-27 14:53:59 UTC", result.updated_at
  end

  def test_it_can_find_all_by_id
    item_repository = ItemRepository.new(nil)
    item_repository.load_data("./data/items.csv")
    result = item_repository.find_all_by_id(4)

    assert_equal 1, result.count
  end

  def test_it_can_find_all_by_name
    item_repository = ItemRepository.new(nil)
    item_repository.load_data("./data/items.csv")
    result = item_repository.find_all_by_name("Item Autem Minima")

    assert_equal 1, result.count
  end

  def test_it_can_find_all_by_description
    item_repository = ItemRepository.new(nil)
    item_repository.load_data("./data/items.csv")
    result = item_repository.find_all_by_description("Non cum provident cumque a dolores voluptates iste. Qui distinctio hic. Officia consequatur et.")

    assert_equal 1, result.count
  end

  def test_it_can_find_all_by_unit_price
    item_repository = ItemRepository.new(nil)
    item_repository.load_data("./data/items.csv")
    result = item_repository.find_all_by_unit_price(4291)

    assert_equal 1, result.count
  end

  def test_it_can_find_all_by_merchant_id
    item_repository = ItemRepository.new(nil)
    item_repository.load_data("./data/items.csv")
    result = item_repository.find_all_by_merchant_id(9)

    assert_equal 34, result.count
  end

  def test_it_can_find_all_by_created_at
    item_repository = ItemRepository.new(nil)
    item_repository.load_data("./data/items.csv")
    result = item_repository.find_all_by_created_at("2012-03-27 14:53:59 UTC")

    assert_equal 170, result.count
  end

  def test_it_can_find_all_by_updated_at
    item_repository = ItemRepository.new(nil)
    item_repository.load_data("./data/items.csv")
    result = item_repository.find_all_by_updated_at("2012-03-27 14:53:59 UTC")

    assert_equal 170, result.count
  end

end
