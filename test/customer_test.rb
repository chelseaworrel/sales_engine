require 'minitest/autorun'
require 'minitest/pride'
require './lib/customer'

class CustomerTest < Minitest::Test

  def test_it_has_the_expected_initialized_variables
    skip
    customer = Customer.new("line")
    expected = [:id, :first_name, :last_name, :created_at, :updated_at]

    expected.each do |header|
      assert customer.respond_to?(header)
    end
  end

  def test_it_has_the_expected_initialized_id
    customer = Customer.new("line")

    assert customer.respond_to?(id)
  end

end
