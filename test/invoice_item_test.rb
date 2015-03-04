ire 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice_item'

class InvoiceItemTest < Minitest::Test

  def test_it_has_the_expected_initialized_variables
    skip
    invoice_item = InvoiceItem.new("line")
    expected = [:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at]

    expected.each do |header|
      assert invoice.respond_to?(header)
    end
  end

  def test_it_has_the_expected_initialized_id
    invoice_item = InvoiceItem.new("line")

    assert invoice.respond_to?(id)
  end

end
