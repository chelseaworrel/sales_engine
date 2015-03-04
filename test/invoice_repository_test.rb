require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice_repository'

class InvoiceRepositoryTest < Minitest::Test

  def test_it_can_take_a_path_when_initialized
    skip
    invoice_repository = InvoiceRepository.new("path")
    assert_equal "path", invoice_repository.path
  end

  def test_it_starts_with_an_empty_array_of_customers
    invoice_repository = InvoiceRepository.new("path")
    assert_equal [], invoice_repository.invoices
  end

  def test_it_can_open_a_CSV_file
    skip
    invoice_repository = InvoiceRepository.new("./data/invoices.csv")
    $stdout = StringIO.new
    file_open = invoices_repository.opener("./data/invoices.csv")
    assert file_open.include?("id")
  end

  def test_it_can_load_data_to_customer
    skip
    invoice_repository = InvoiceRepository.new("./data/invoices.csv")
    customers = []
    invoice_repository.load_data

    assert_equal 1, customers.first.id
  end

end
