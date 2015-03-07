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

  def revenue
    #   successful_invoices = invoices.select do |invoice|
    #     invoice.transactions.select do |transaction|
    #       transaction.result == "fail"
    #   end
    # end
    # revenue = successful_invoices.map do |invoice|
    #   invoice.invoice_items.reduce(0) do |sum, inv_item|
    #     sum += inv_item.revenue
    #   end
    # end.inject(:+)
    # revenue.to_digits
  end

end
