require 'minitest/autorun'
require 'minitest/pride'
require './lib/item_repository'

class ItemRepositoryTest < Minitest::Test

  def test_it_can_take_a_path_when_initialized
    skip
    item_repository = ItemRepository.new("path")
    assert_equal "path", item_repository.path
  end

  def test_it_starts_with_an_empty_array_of_customers
    item_repository = ItemRepository.new("path")
    assert_equal [], item_repository.items
  end

  def test_it_can_open_a_CSV_file
    skip
    item_repository = ItemRepository.new("./data/items.csv")
    $stdout = StringIO.new
    file_open = customer_repository.opener("./data/items.csv")
    assert file_open.include?("id")
  end

  def test_it_can_load_data_to_customer
    skip
    item_repository = ItemRepository.new("./data/items.csv")
    items = []
    item_repository.load_data

    assert_equal 1, customers.first.id
  end

end
