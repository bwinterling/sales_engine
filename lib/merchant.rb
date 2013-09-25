require 'csv'

class Merchant

  attr_reader :id, :name, :created_at, :updated_at

  def initialize(csv_row_data)
    
    @id = csv_row_data[:id]
    @name = csv_row_data[:name]
    @created_at = csv_row_data[:created_at]
    @updated_at = csv_row_data[:updated_at]

  end

  def items
    #find all items with merchant_id 
  end

  def invoices
    invoices = InvoiceRepository.new.find_all_by_merchant_id(@id)
    invoices
  end
#end of Merchant class
end
