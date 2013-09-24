require 'csv'


class Invoice

  attr_reader :id, :customer_id, :merchant_id, :status, :created_at, :updated_at

  def initialize(csv_row_data)
      
    @id = csv_row_data[:id]
    @customer_id = csv_row_data[:customer_id]
    @merchant_id = csv_row_data[:merchant_id]
    @status = csv_row_data[:status]
    @created_at = csv_row_data[:created_at]
    @updated_at = csv_row_data[:updated_at]
    
  end

  def transactions
  end

  def invoice_items
  end

  def items
  end

  def customer
  end

  def merchant
  end
      
    
end

