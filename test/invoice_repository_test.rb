require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice_repository'

class InvoiceRepositoryTest < Minitest::Test

  def test_it_starts_with_an_empty_array_of_invoices
    invoice_repository = InvoiceRepository.new(nil)
    assert_equal [], invoice_repository.invoices
  end


  def test_it_can_load_data_to_invoice
    invoice_repository = InvoiceRepository.new(nil)
    invoice_repository.load_data("./data/invoices.csv")

    assert_equal 1, invoice_repository.invoices.first.customer_id
    assert_equal 1, invoice_repository.invoices.first.id
    assert_equal 26, invoice_repository.invoices.first.merchant_id
  end

  def test_it_can_return_all_invoices
    invoice_repository = InvoiceRepository.new(nil)
    invoice_repository.load_data("./data/invoices.csv")

    refute invoice_repository.invoices.empty?
  end

  def test_it_can_return_random_sample
    invoice_repository = InvoiceRepository.new(nil)
    invoice_repository.load_data("./data/invoices.csv")

    assert invoice_repository.random
  end

  def test_it_can_find_by_id
    invoice_repository = InvoiceRepository.new(nil)
    invoice_repository.load_data("./data/invoices.csv")
    result = invoice_repository.find_by_id(4)

    assert_equal 4, result.id
  end

  def test_it_can_find_by_customer_id
    invoice_repository = InvoiceRepository.new(nil)
    invoice_repository.load_data("./data/invoices.csv")
    result = invoice_repository.find_by_customer_id(1)

    assert_equal 1, result.customer_id
  end

  def test_it_can_find_by_merchant_id
    invoice_repository = InvoiceRepository.new(nil)
    invoice_repository.load_data("./data/invoices.csv")
    result = invoice_repository.find_by_merchant_id(1)

    assert_equal 1, result.merchant_id
  end

  def test_it_can_find_by_status
    invoice_repository = InvoiceRepository.new(nil)
    invoice_repository.load_data("./data/invoices.csv")
    result = invoice_repository.find_by_status("shipped")

    assert_equal "shipped", result.status
  end

  def test_it_can_find_by_created_at
    invoice_repository = InvoiceRepository.new(nil)
    invoice_repository.load_data("./data/invoices.csv")
    result = invoice_repository.find_by_created_at("2012-03-06 21:54:10 UTC")

    assert_equal "2012-03-06 21:54:10 UTC", result.created_at
  end

  def test_it_can_find_by_updated_at
    invoice_repository = InvoiceRepository.new(nil)
    invoice_repository.load_data("./data/invoices.csv")
    result = invoice_repository.find_by_updated_at("2012-03-06 21:54:10 UTC")

    assert_equal "2012-03-06 21:54:10 UTC", result.updated_at
  end

  def test_it_can_find_all_by_id
    invoice_repository = InvoiceRepository.new(nil)
    invoice_repository.load_data("./data/invoices.csv")
    result = invoice_repository.find_all_by_id(4)

    assert_equal 1, result.count
  end

  def test_it_can_find_all_by_customer_id
    invoice_repository = InvoiceRepository.new(nil)
    invoice_repository.load_data("./data/invoices.csv")
    result = invoice_repository.find_all_by_customer_id(523)

    assert_equal 10, result.count
  end

  def test_it_can_find_all_by_merchant_id
    invoice_repository = InvoiceRepository.new(nil)
    invoice_repository.load_data("./data/invoices.csv")
    result = invoice_repository.find_all_by_merchant_id(1)

    assert_equal 59, result.count
  end

  def test_it_can_find_all_by_status
    invoice_repository = InvoiceRepository.new(nil)
    invoice_repository.load_data("./data/invoices.csv")
    result = invoice_repository.find_all_by_status("shipped")

    assert_equal 4843, result.count
  end

  def test_it_can_find_all_by_created_at
    invoice_repository = InvoiceRepository.new(nil)
    invoice_repository.load_data("./data/invoices.csv")
    result = invoice_repository.find_all_by_created_at("2012-03-27 14:54:10 UTC")

    assert_equal 0, result.count
  end

  def test_it_can_find_all_by_updated_at
    invoice_repository = InvoiceRepository.new(nil)
    invoice_repository.load_data("./data/invoices.csv")
    result = invoice_repository.find_all_by_updated_at("2012-03-27 14:54:10 UTC")

    assert_equal 0, result.count
  end
end
