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
    invoices.map do |invoice|
      invoice.transactions
    end.flatten
  end

  def favorite_merchant

    successful_invoices = successful_invoices(successful_transactions)

    successful_merchants = successful_merchants(successful_invoices)

    successful_merchants.max_by do |merchant|
      successful_merchants.count(merchant)
    end
  end

  private

  def successful_transactions
    transactions.select { |transaction| transaction.successful? }
  end

  def successful_invoices(transactions)
    transactions.map { |sv| sv.invoice }
  end

  def successful_merchants(invoices)
    invoices.map { |invoice| invoice.merchant }
  end
end
