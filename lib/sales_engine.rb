# require 'csv'
require_relative './customer_repository'
require_relative './invoice_repository'
require_relative './invoice_item_repository'
require_relative './item_repository'
require_relative './merchant_repository'
require_relative './transaction_repository'

class SalesEngine
attr_reader :customer_repository
            :invoice_repository
            :invoice_item_repository
            :item_repository
            :merchant_repository
            :transaction_repository
# 
# def initialize
#
# end
#
# def start_up
#
# end

end
