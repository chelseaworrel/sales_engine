class Customer
  attr_reader :id,
              :first_name,
              :last_name,
              :created_at,
              :updated_at,
              :repository

  def initialize(line, repository)
    @id         = line[:id].to_i
    @first_name = line[:first_name]
    @last_name  = line[:last_name]
    @created_at = line[:created_at]
    @updated_at = line[:updated_at]
    @repository = repository
  end

  def invoices
    repository.find_invoices(id)
  end

  def transactions
    customer_transactions = invoices.map { |invoice| invoice.transactions }.flatten
  end

  def favorite_merchant
    successful_transactions = transactions.select { |transaction| transaction.successful? }

    successful_invoices = successful_transactions.map { |sv| sv.invoice }

    successful_merchants = successful_invoices.map { |invoice| invoice.merchant }

    successful_merchants.max_by { |merchant| successful_merchants.count(merchant) }
      #figure out if they want count or name
  end

end
