require 'csv'
require_relative 'transaction'


class TransactionRepository
  attr_reader :transactions, :sales_engine

  def initialize(sales_engine)
    @transactions = []
    @sales_engine = sales_engine
  end

  def load_data(path)
    file = CSV.open(path, headers: true, header_converters: :symbol)
    file.map do |line|
      @transactions << Transaction.new(line, self)
    end
    file.close
  end

  #id,invoice_id,credit_card_number,credit_card_expiration_date,result,created_at,updated_at

  def all
    @transactions
  end

  def random
    @transactions.sample
  end

  def find_by_id(id)
    @transactions.find do |transaction|
       transaction.id == id
    end
  end

  def find_by_invoice_id(invoice_id)
    @transactions.find do |transaction|
       transaction.invoice_id == invoice_id
    end
  end

  def find_by_credit_card_number(credit_card_number)
    @transactions.find do |transaction|
       transaction.credit_card_number == credit_card_number
    end
  end

  def find_by_credit_card_expiration_date(credit_card_expiration_date)
    @transactions.find do |transaction|
       transaction.credit_card_expiration_date == credit_card_expiration_date
    end
  end

  def find_by_result(result)
    @transactions.find do |transaction|
       transaction.result == result
    end
  end

  def find_by_created_at(created_at)
    @transactions.find do |transaction|
       transaction.created_at == created_at
    end
  end

  def find_by_updated_at(updated_at)
    @transactions.find do |transaction|
       transaction.updated_at == updated_at
    end
  end

  def find_all_by_id(id)
    @transactions.find_all do |transaction|
      transaction.id == id
    end
  end

  def find_all_by_invoice_id(invoice_id)
    @transactions.find_all do |transaction|
      transaction.invoice_id == invoice_id
    end
  end

  def find_all_by_credit_card_number(credit_card_number)
    @transactions.find_all do |transaction|
      transaction.credit_card_number == credit_card_number
    end
  end

  def find_all_by_credit_card_expiration_date(credit_card_expiration_date)
    @transactions.find_all do |transaction|
      transaction.credit_card_expiration_date == credit_card_expiration_date
    end
  end

  def find_all_by_result(result)
    @transactions.find_all do |transaction|
      transaction.result == result
    end
  end

  def find_all_by_created_at(created_at)
    @transactions.find_all do |transaction|
      transaction.created_at == created_at
    end
  end

  def find_all_by_updated_at(updated_at)
    @transactions.find_all do |transaction|
      transaction.updated_at == updated_at
    end
  end
end
