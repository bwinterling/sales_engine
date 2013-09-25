require 'csv'
require_relative 'transaction'

class TransactionRepository

  attr_reader :transactions_csv, :transactions

  def initialize
    load_transactions_csv
    @transactions ||= all
  end

  def load_transactions_csv
    @transactions_csv ||= CSV.read('data/transactions.csv', headers: true, header_converters: :symbol)
  end

  def all
    @transactions = @transactions_csv.collect { |row| Transaction.new(row) }
  end

  def random
    random_id = ""
    total_rows = @transactions.count
    random_id = rand(total_rows).to_s
    random_transaction = @transactions.find { |transaction| transaction.id == random_id }
  end

  def find_by_transaction_id(match)
    @transactions.find { |transaction| transaction.id == match }
  end

  def find_by_invoice_id(match)
    @transactions.find { |transaction| transaction.invoice_id == match }
  end

  def find_all_by_invoice_id(match)
    @transactions.find_all { |transaction| transaction.invoice_id == match }   
  end

  def find_by_credit_card_number(match)
    @transactions.find { |transaction| transaction.credit_card_number == match }
  end

  def find_all_by_credit_card_number(match)
    @transactions.find_all { |transaction| transaction.credit_card_number == match }
  end

  def find_by_result(match)
    @transactions.find { |transaction| transaction.result.downcase == match.downcase }
  end

  def find_all_by_result(match)
    @transactions.find_all { |transaction| transaction.result.downcase == match.downcase }

  end

# end of class
end
