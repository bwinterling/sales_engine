require 'csv'

class Invoice

  attr_reader :id, :customer_id, :merchant_id, :status, :created_at, :updated_at

  def initialize(invoice_repository, csv_row_data)
    
    @invoice_repository = invoice_repository
    @id = csv_row_data[:id]
    @customer_id = csv_row_data[:customer_id]
    @merchant_id = csv_row_data[:merchant_id]
    @status = csv_row_data[:status]
    @created_at = csv_row_data[:created_at]
    @updated_at = csv_row_data[:updated_at]
    
  end

  def transactions
    @invoice_repository.find_all_transactions_by_invoice(@id)
  end

  def invoice_items
    @invoice_repository.find_all_invoice_items_by_invoice(@id)
  end

  def items
    @invoice_repository.find_all_items_by_invoice(@id)
  end

  def customer
    @invoice_repository.find_customer_by_(@customer_id)
  end

  def merchant
    @invoice_repository.find_merchants_by(@merchant_id)
  end

  def successful?
    transactions.any? { |transaction| transaction.result == 'success' }
  end 
    
end

