require 'bigdecimal'
require 'bigdecimal/util'
require 'date'

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

  def revenue(date=nil)
    date.nil? ? date : date = parse_date(date.to_s)

    successful_transactions = successful_transactions(merchant_transactions)

    successful_invoices = successful_invoices(successful_transactions)

    if date.nil?
      parsed_successful_invoices = successful_invoices
    else
      parsed_successful_invoices = successful_invoices.select do |invoice|
        invoice.created_at == date
      end
    end

    successful_invoice_items = parsed_successful_invoices.map do |invoice|
      invoice.invoice_items
    end.flatten
    successful_invoice_items.reduce(0) do |sum, inv_item|
      sum += inv_item.revenue
    end
  end

  def favorite_customer

    successful_transactions = successful_transactions(merchant_transactions)

    successful_invoices = successful_invoices(successful_transactions)

    merchant_customers = successful_invoices.map do |invoice|
      invoice.customer
    end
    merchant_customers.max_by do |customer|
      merchant_customers.count(customer)
    end
  end

  def customers_with_pending_invoices
    unsuccessful_invoices

    unsuccessful_invoices.map do |invoice|
      invoice.customer
    end
  end

  def quantity_successful_items
    merchant_transactions

    successful_transactions = successful_transactions(merchant_transactions)

    successful_invoices = successful_invoices(successful_transactions)

    successful_invoice_items = successful_invoices.map do |invoice|
      invoice.items
    end.flatten.count
  end

  private

  def merchant_transactions
    @merchant_transactions ||= invoices.map do |invoice|
      invoice.transactions
    end.flatten
  end

  def successful_transactions(merchant_trans)
    @successful_transactions ||= merchant_trans.select do |transaction|
      transaction.successful?
    end
  end

  def successful_invoices(good_transactions)
    @successful_invoices ||= good_transactions.map do |transaction|
      transaction.invoice
    end
  end

  def successful_invoice_items(good_invoices)
    @successful_invoice_items ||= good_invoices.map do |invoice|
      invoice.invoice_items
    end.flatten
  end

  def parsed_good_invoice_items(parsed_successful_invoices)
    @parsed_good_invoice_items ||= parsed_successful_invoices.map do |invoice|
      invoice.invoice_items
    end.flatten
  end

  def parse_date(date)
    Date.parse(date)
  end

  def unsuccessful_invoices
    invoices.reject do |invoice|
      invoice.transactions.any? do |transaction|
        transaction.successful?
      end
    end.flatten
  end
end
