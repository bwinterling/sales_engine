require 'csv'
require 'bigdecimal'
require_relative 'transaction'

class Invoice

  attr_reader :id, :customer_id, :merchant_id, :status,
    :created_at, :updated_at, :invoice_repository

  def initialize(invoice_repository, csv_row_data)
    @invoice_repository = invoice_repository
    @id = csv_row_data[:id]
    @customer_id = csv_row_data[:customer_id]
    @merchant_id = csv_row_data[:merchant_id]
    @status = csv_row_data[:status]
    @created_at = Date.parse(csv_row_data[:created_at])
    @updated_at = Date.parse(csv_row_data[:updated_at])
  end

  def transaction_repo
    invoice_repository.sales_engine.transaction_repository
  end

  def transactions
    invoice_repository.find_all_transactions_by_invoice(@id)
  end

  def invoice_items
    invoice_repository.find_all_invoice_items_by_invoice(@id)
  end

  def items
    invoice_repository.find_all_items_by_invoice(@id)
  end

  def customer
    invoice_repository.find_customer_by_(@customer_id)
  end

  def merchant
    invoice_repository.find_merchants_by(@merchant_id)
  end

  def successful?
    transactions.any? { |transaction| transaction.result == 'success' }
  end

  def pending?
    transactions.none? { |transaction| transaction.result == 'success' }
  end

  def items_sold
    total = 0
    invoice_items.each { |ii| total += ii.quantity.to_i }
    total
  end

  def revenue
    total = 0
    invoice_items.each { |ii| total += ii.total_sale }
    to_big_dec(total)
  end

  def to_big_dec(integer)
    string = (integer / 100.0).to_s
    BigDecimal(string)
  end

  def charge(input_hash)
    unless pending?
      raise ArgumentError.new("Charge rejected: invoice alread paid")
    else
      all_transactions = transaction_repo.all
      row = {
        id:           (all_transactions.count + 1).to_s,
        invoice_id:                   id,
        credit_card_number:           input_hash[:credit_card_number],
        credit_card_expiration_date:  input_hash[:credit_card_expiration],
        result:                       input_hash[:result],
        created_at:                   Date.today.to_s,
        updated_at:                   Date.today.to_s
      }
      all_transactions << Transaction.new(transaction_repo, row)
    end
  end

end

