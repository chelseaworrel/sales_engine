require './test/test_helper'
require './lib/sales_engine'

class SalesEngineTest < Minitest::Test
  attr_reader :sales_engine

  def setup
    @sales_engine = SalesEngine.new
    sales_engine.startup
  end

  def test_it_exists
    assert SalesEngine.new
  end

  def test_it_can_start_up
    assert sales_engine.customer_repository
    assert sales_engine.merchant_repository
    assert sales_engine.transaction_repository
    assert sales_engine.item_repository
    assert sales_engine.invoice_repository
    assert sales_engine.invoice_item_repository
  end

  def test_it_can_load_data_at_startup
    sales_engine.customer_repository.load_data("./data/customers.csv")

    refute sales_engine.customer_repository.customers.empty?
  end

  #build these tests for all repositories(load data)

  def test_it_can_load_customer_data_at_startup
    sales_engine.customer_repository.load_data("./data/customers.csv")

    assert_equal "Joey", sales_engine.customer_repository.customers.first.first_name
  end

  def test_it_can_find_items_by_merchant_id
    items = sales_engine.find_items_by_merchant_id(2)

    assert_equal 38, items.count
  end



end
