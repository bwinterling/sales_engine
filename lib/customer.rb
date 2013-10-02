require 'csv'

class Customer

  attr_reader :id, :first_name, :last_name, :created_at, :updated_at

  def initialize(customer_repository, csv_row_data)

    @customer_repository = customer_repository
    @id = csv_row_data[:id]
    @first_name = csv_row_data[:first_name]
    @last_name = csv_row_data[:last_name]
    @created_at = Date.parse(csv_row_data[:created_at])
    @updated_at = Date.parse(csv_row_data[:updated_at])
  
  end

  def invoices
    @customer_repository.find_invoices_by(@id)
  end

  def successful_invoices
    invoices.find_all { |i| i.successful? }
  end

  def pending_invoices
    invoices.find_all { |i| i.pending? }
  end

  def has_pending_invoices?
    true unless pending_invoices.empty?
  end

  def transactions
    transactions = invoices.collect { |i| i.transactions }
    transactions.flatten
  end

  def merchants
    invoices.collect { |i| i.merchant }.uniq
  end

  def favorite_merchant
    merchants.max_by { |m| m.successful_invoices.count}
  end

end
