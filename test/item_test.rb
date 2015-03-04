require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'

class ItemTest < Minitest::Test

  def test_it_has_the_expected_initialized_variables
    skip
    item = Item.new("line")
    expected = [:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at]

    expected.each do |header|
      assert item.respond_to?(header)
    end
  end

  def test_it_has_the_expected_initialized_id
    item = Item.new("line")

    assert item.respond_to?(id)
  end

end
