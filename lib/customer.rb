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
    customer_transactions = invoices.map do |invoice|
      invoice.transactions
    end.flatten
    customer_transactions
  end

  def favorite_merchant
    successful_transactions = transactions.select do |transaction|
      transaction.result == "success"
    end
    successful_invoices = successful_transactions.map do |sv|
      sv.invoice
    end
    successful_merchants = successful_invoices.map do |invoice|
      invoice.merchant
    end
    successful_merchants.max_by do |merchant|
      successful_merchants.count(merchant)
      #figure out if they want count or name
    end
  end

end
