require 'bigdecimal/util'

class Item
  attr_reader :id,
              :name,
              :description,
              :unit_price,
              :merchant_id,
              :created_at,
              :updated_at,
              :repository

  def initialize(line, repository)
    @id          = line[:id].to_i
    @name        = line[:name]
    @description = line[:description]
    @unit_price  = BigDecimal.new(line[:unit_price])/100
    @merchant_id = line[:merchant_id].to_i
    @created_at  = line[:created_at]
    @updated_at  = line[:updated_at]
    @repository  = repository
  end

  def invoice_items
    repository.find_invoice_items(id)
  end

  def merchant
    repository.find_merchant(merchant_id)
  end

  def best_day
    maximum_item = invoice_items.max_by { |invoice_item| invoice_item.quantity }
    maximum_item.invoice.created_at
  end

  def revenue

    invoices_transactions = invoices_transactions(items_invoices)

    successful_transactions = successful_transactions(invoices_transactions)

    successful_invoices = successful_invoices(successful_transactions)

    successful_invoice_items = successful_invoice_items(successful_invoices)

    final_invoice_items = final_invoice_items(successful_invoice_items)

    invoice_item_revenue = final_invoice_items.map do |inv_item|
      inv_item.revenue
    end
    invoice_item_revenue.reduce(:+)
  end

  def quantity_sold

    invoices_transactions = invoices_transactions(items_invoices)

    successful_transactions = successful_transactions(invoices_transactions)

    successful_invoices = successful_invoices(successful_transactions)

    successful_invoice_items = successful_invoice_items(successful_invoices)

    final_invoice_items = final_invoice_items(successful_invoice_items)

    final_invoice_items.flatten.map do |inv_item|
      inv_item.quantity
    end.reduce(:+)
  end

  private

  def items_invoices
    @items_invoices ||= invoice_items.map do |inv_item|
      inv_item.nil? ? [] : inv_item.invoice
    end.uniq
  end

  def invoices_transactions(items_invoices)
    @invoices_transactions ||= items_invoices.map do |invoice|
      invoice.transactions
    end.flatten
  end

  def successful_transactions(invoices_transactions)
    @successful_transactions ||= invoices_transactions.reject do |transaction|
      !transaction.successful?
    end
  end

  def successful_invoices(successful_transactions)
    @successful_invoices ||= successful_transactions.map do |transaction|
      transaction.invoice
    end
  end

  def successful_invoice_items(successful_invoices)
    @successful_invoice_items ||= successful_invoices.map do |invoice|
      invoice.invoice_items
    end.flatten
  end

  def final_invoice_items(successful_invoice_items)
    @final_invoice_items ||= successful_invoice_items.select do |inv_item|
     inv_item.item_id == id
    end
  end
end
