require 'minitest/autorun'
require 'minitest/pride'
require './lib/transaction_repository'

class TransactionRepositoryTest < Minitest::Test

  def test_it_can_take_a_path_when_initialized
    skip
    transaction_repository = TransactionRepository.new("path")
    assert_equal "path", transaction_repository.path
  end

  def test_it_starts_with_an_empty_array_of_customers
    transaction_repository = TransactionRepository.new("path")
    assert_equal [], transaction_repository.customers
  end

  def test_it_can_open_a_CSV_file
    skip
    transaction_repository = TransactionRepository.new("path")
    $stdout = StringIO.new
    file_open = transaction_repository.opener("./data/transactions.csv")
    assert file_open.include?("id")
  end

  def test_it_can_load_data_to_customer
    skip
    transaction_repository = TransactionRepository.new("./data/transactions.csv")
    transactions = []
    transaction_repository.load_data

    assert_equal 1, transactions.first.id
  end

end
