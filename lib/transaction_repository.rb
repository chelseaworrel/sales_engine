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
      transactions << Transaction.new(line, self)
    end
    file.close
  end

  def inspect
    "#<#{self.class} #{@transactions.size} rows>"
  end

  def all
    transactions
  end

  def random
    transactions.sample
  end

  def all_successful
    transactions.select do |transaction|
      transaction.result == "success"
    end
  end

  def find_by_id(id)
    transactions.detect do |transaction|
       transaction.id == id
    end
  end

  def find_by_invoice_id(invoice_id)
    transactions.detect do |transaction|
       transaction.invoice_id == invoice_id
    end
  end

  def find_by_credit_card_number(credit_card_number)
    transactions.detect do |transaction|
       transaction.credit_card_number == credit_card_number
    end
  end

  def find_by_credit_card_expiration_date(credit_card_expiration_date)
    transactions.detect do |transaction|
       transaction.credit_card_expiration_date == credit_card_expiration_date
    end
  end

  def find_by_result(result)
    transactions.detect do |transaction|
       transaction.result == result
    end
  end

  def find_by_created_at(created_at)
    transactions.detect do |transaction|
       transaction.created_at == created_at
    end
  end

  def find_by_updated_at(updated_at)
    transactions.detect do |transaction|
       transaction.updated_at == updated_at
    end
  end

  def find_all_by_id(id)
    transactions.select do |transaction|
      transaction.id == id
    end
  end

  def find_all_by_invoice_id(invoice_id)
    transactions.select do |transaction|
      transaction.invoice_id == invoice_id
    end
  end

  def find_all_by_credit_card_number(credit_card_number)
    transactions.select do |transaction|
      transaction.credit_card_number == credit_card_number
    end
  end

  def find_all_by_credit_card_expiration_date(credit_card_expiration_date)
    transactions.select do |transaction|
      transaction.credit_card_expiration_date == credit_card_expiration_date
    end
  end

  def find_all_by_result(result)
    transactions.select do |transaction|
      transaction.result == result
    end
  end

  def find_all_by_created_at(created_at)
    transactions.select do |transaction|
      transaction.created_at == created_at
    end
  end

  def find_all_by_updated_at(updated_at)
    transactions.select do |transaction|
      transaction.updated_at == updated_at
    end
  end

  def find_invoice(id)
    sales_engine.find_invoice_by_id(id)
  end
end

#Refactor:
#find the duplicates and only put those methods in a module
#credit_card.transactions.all
# require 'the file location'
# Class the class you are using
# include WhateverTheHeckWeWant
# module WhateverTheHeckWeWant
#   nothing but methods in the module
# # def find_by_id(id, data_type)
#   data_type.find do |datum|
#      datum.id == id
#   end
# end
