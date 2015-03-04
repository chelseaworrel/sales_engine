require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice_item_repository'

class InvoiceRepositoryTest < Minitest::Test

  def test_it_can_take_a_path_when_initialized
    skip
    invoice_item_repository = InvoiceItemRepository.new("path")
    assert_equal "path", invoice_item_repository.path
  end

  def test_it_starts_with_an_empty_array_of_customers
    invoice_item_repository = InvoiceItemRepository.new("path")
    assert_equal [], invoice_item_repository.invoice_items
  end

  def test_it_can_open_a_CSV_file
    skip
    invoice_item_repository = InvoiceItemRepository.new("./data/invoices.csv")
    $stdout = StringIO.new
    file_open = invoices_item_repository.opener("./data/invoice_items.csv")
    assert file_open.include?("id")
  end

  def test_it_can_load_data_to_customer
    skip
    invoice_item_repository = InvoiceItemRepository.new("./data/invoice_items.csv")
    invoic_items = []
    invoice_item_repository.load_data

    assert_equal 539, customers.first.item_id
  end

end
