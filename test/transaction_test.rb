require 'minitest/autorun'
require 'minitest/pride'
require './lib/transaction'

class TransactionTest < Minitest::Test

  def test_it_has_the_expected_initialized_variables
    skip
    transaction = Transaction.new("line")
    expected = [:id, :invoice_id, :credit_card_number, :credit_card_expiration_date, :result, :created_at, :updated_at]

    expected.each do |header|
      assert customer.respond_to?(header)
    end
  end

  def test_it_has_the_expected_initialized_id
    transaction = Transaction.new("line")

    assert customer.respond_to?(id)
  end

end
