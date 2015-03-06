require_relative './customer_repository'
require_relative './merchant_repository'
require_relative './invoice_repository'
require_relative './invoice_item_repository'
require_relative './item_repository'
require_relative './transaction_repository'

class SalesEngine
  attr_reader :customer_repository,
              :invoice_repository,
              :invoice_item_repository,
              :item_repository,
              :merchant_repository,
              :transaction_repository

  def startup
    @customer_repository = CustomerRepository.new(self)
    @customer_repository.load_data("./data/customers.csv")
    @merchant_repository = MerchantRepository.new(self)
    @merchant_repository.load_data("./data/merchants.csv")
    @transaction_repository = TransactionRepository.new(self)
    @transaction_repository.load_data("./data/transactions.csv")
    @item_repository = ItemRepository.new(self)
    @item_repository.load_data("./data/items.csv")
    @invoice_repository = InvoiceRepository.new(self)
    @invoice_repository.load_data("./data/invoices.csv")
    @invoice_item_repository = InvoiceItemRepository.new(self)
    @invoice_item_repository.load_data("./data/invoice_items.csv")
  end

  def find_items_by_merchant_id(id)
    item_repository.find_all_by_merchant_id(id)
  end

  def find_invoices_by_merchant_id(id)
    invoice_repository.find_all_by_merchant_id(id)
  end

  def find_invoice_items_by_item_id(id)
    invoice_item_repository.find_all_by_item_id(id)
  end

  def find_merchant_by_id(id)
    merchant_repository.find_by_id(id)
  end

  def find_invoice_by_id(id)
    invoice_repository.find_by_id(id)
  end

  def find_invoices_by_customer_id(id)
    invoice_repository.find_all_by_customer_id(id)
  end

  def find_invoice_by_id(id)
    invoice_repository.find_by_id(id)
  end

  def find_item_by_id(id)
    item_repository.find_by_id(id)
  end

end


sales_engine = SalesEngine.new

sales_engine.startup.inspect

#puts sales_engine.transaction_repository.transactions

# sales_engine = SalesEngine.new
#
# sales_engine.startup.inspect
#
# puts sales_engine.customer_repository.customers
