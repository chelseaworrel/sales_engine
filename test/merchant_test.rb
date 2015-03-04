require 'minitest/autorun'
require 'minitest/pride'
require './lib/merchant'

class MerchantTest < Minitest::Test

  def test_it_has_the_expected_initialized_variables
    skip
    merchant = Merchant.new("line")
    expected = [:id, :name, :created_at, :updated_at]

    expected.each do |header|
      assert merchant.respond_to?(header)
    end
  end

  def test_it_has_the_expected_initialized_id
    merchant = Merchant.new("line")

    assert merchant.respond_to?(id)
  end

end
