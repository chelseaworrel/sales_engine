require './test/test_helper'
require './lib/item'

class ItemTest < Minitest::Test
  attr_reader :data

  def setup
    @data =   {
                id:          "1",
                name:        "Item Qui Esse",
                description: "Nihil autem sit",
                unit_price:  "75107",
                merchant_id: "1",
                created_at:  "2012-03-27 14:53:59 UTC",
                updated_at:  "2012-03-27 14:53:59 UTC"
              }
  end

  def test_it_has_the_expected_initialized_id
    item = Item.new(data, nil)

    assert 1, item.id
  end

  def test_it_has_the_expected_initialized_name
    item = Item.new(data, nil)

    assert "Item Qui Esse", item.name
  end

  def test_it_has_the_expected_initialized_description
    item = Item.new(data, nil)

    assert "Nihil autem sit", item.description
  end

  def test_it_has_the_expected_initialized_unit_price
    item = Item.new(data, nil)

    assert 75107, item.unit_price
  end

  def test_it_has_the_expected_initialized_merchant_id
    item = Item.new(data, nil)

    assert 1, item.merchant_id
  end

  def test_it_has_the_expected_initialized_created_at
    item = Item.new(data, nil)

    assert "2012-03-27 14:53:59 UTC", item.created_at
  end

  def test_it_has_the_expected_initialized_updated_at
    item = Item.new(data, nil)

    assert "2012-03-27 14:53:59 UTC", item.updated_at
  end

end
