# require 'csv'
require_relative './customer_repository'
<<<<<<< HEAD
# require_relative './invoice_repository'
# require_relative './invoice_item_repository'
# require_relative './item_repository'
# require_relative './merchant_repository'
=======
require_relative './invoice_repository'
require_relative './invoice_item_repository'
require_relative './item_repository'
require_relative './merchant_repository'
>>>>>>> master
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
    @transaction_repository = TransactionRepository.new(self)
    @transaction_repository.load_data("./data/transactions.csv")
    @invoice_repository = InvoiceRepository.new(self)
    @invoice_repository.load_data("./data/invoices.csv")
    @invoice_item_repository = InvoiceItemRepository.new(self)
    @invoice_item_repository.load_data("./data/invoice_items.csv")
  end
end


<<<<<<< HEAD
sales_engine = SalesEngine.new

sales_engine.startup.inspect

puts sales_engine.transaction_repository.transactions
=======
# sales_engine = SalesEngine.new
#
# sales_engine.startup.inspect
#
# puts sales_engine.customer_repository.customers
>>>>>>> master
