require 'csv'
require_relative 'transaction'

class TransactionRepository

  def initialize(sales_engine)
    @sales_engine = sales_engine
  end

  def data
    CSV.read(data_file, headers: true, header_converters: :symbol)
  end

  def data_file
    "#{@sales_engine.dir}transactions.csv"
  end

  def transactions
    all
  end

  def all
    @all ||= data.collect { |row| Transaction.new(self, row) }
  end

  def random
    all.sample
  end

  def find_by_transaction_id(match)
    all.find { |transaction| transaction.id == match }
  end

  def find_by_invoice_id(match)
    all.find { |transaction| transaction.invoice_id == match }
  end

  def find_all_by_invoice_id(match)
    all.find_all { |transaction| transaction.invoice_id == match }   
  end

  def find_by_credit_card_number(match)
    all.find { |transaction| transaction.credit_card_number == match }
  end

  def find_all_by_credit_card_number(match)
    all.find_all { |transaction| transaction.credit_card_number == match }
  end

  def find_by_result(match)
    all.find { |transaction| transaction.result.downcase == match.downcase }
  end

  def find_all_by_result(match)
    all.find_all { |transaction| transaction.result.downcase == match.downcase }
  end

  def find_invoice_by(invoice_id)
    @sales_engine.invoice_repository.find_by_invoice_id(invoice_id)
  end

end
