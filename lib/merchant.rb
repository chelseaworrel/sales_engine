require 'bigdecimal'
require 'bigdecimal/util'


class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :repository

  def initialize(line, repository)
    @id         = line[:id].to_i
    @name       = line[:name]
    @created_at = line[:created_at]
    @updated_at = line[:updated_at]
    @repository = repository
  end

  def items
    repository.find_items(id)
  end

  def invoices
    repository.find_invoices(id)
  end

  # def revenue
  #   merchant_transactions = invoices.map do |invoice|
  #     invoice.transactions
  #   end.flatten
  #   successful_transactions = merchant_transactions.select do |transaction|
  #       transaction.successful?
  #   end
  #   successful_invoices = successful_transactions.map do |transaction|
  #     transaction.invoice
  #   end
  #   revenue = successful_invoices.map do |invoice|
  #     invoice.invoice_items.reduce(0) do |sum, inv_item|
  #       sum += inv_item.revenue
  #     end
  #   end.inject(:+)
  #   revenue.to_digits
  # end

  def revenue(date=nil)
    merchant_transactions = invoices.map do |invoice|
      invoice.transactions
    end.flatten
    successful_transactions = merchant_transactions.select do |transaction|
        transaction.successful?
    end
    successful_invoices = successful_transactions.map do |transaction|
      transaction.invoice
    end
    if date.nil?
      successful_invoices_parsed = successful_invoices
    else
      successful_invoices_parsed = successful_invoices.select do |invoice|
        invoice.created_at == date
      end
    end
    successful_invoice_items = successful_invoices_parsed.map do |invoice|
      invoice.invoice_items
    end.flatten
    revenue = successful_invoice_items.reduce(0) do |sum, inv_item|
      sum += inv_item.revenue
    end
    if !revenue.zero?
     revenue.to_digits
   end
  end

  def favorite_customer
    merchant_transactions = invoices.map do |invoice|
      invoice.transactions
    end.flatten
    successful_transactions = merchant_transactions.select do |transaction|
        transaction.successful?
    end
    successful_invoices = successful_transactions.map do |transaction|
      transaction.invoice
    end.flatten
    merchant_customers = successful_invoices.map do |invoice|
      invoice.customer
    end
    merchant_customers.max_by do |customer|
      merchant_customers.count(customer)
    end
  end

  def customers_with_pending_invoices
    merchant_transactions = invoices.map do |invoice|
      invoice.transactions
    end.flatten
    unsuccessful_transactions = merchant_transactions.reject do |transaction|
        transaction.successful?
    end
    unsuccessful_invoices = unsuccessful_transactions.map do |transaction|
      transaction.invoice
    end
    unsuccessful_invoices.map do |invoice|
      invoice.customer
    end.uniq
  end
end
