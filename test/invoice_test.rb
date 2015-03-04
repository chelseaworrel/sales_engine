require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice'

class InvoiceTest < Minitest::Test

  def test_it_has_the_expected_initialized_variables
    skip
    invoice = Invoice.new("line")
    expected = [:id, :customer_id, :merchant_id, :status, :created_at, :updated_at]

    expected.each do |header|
      assert invoice.respond_to?(header)
    end
  end

  def test_it_has_the_expected_initialized_id
    invoice = Invoice.new("line")

    assert invoice.respond_to?(id)
  end

end
