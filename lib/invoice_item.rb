require 'csv'

class InvoiceItem

  attr_reader :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at

  def initialize(csv_row_data)

    @item_id = csv_row_data[:item_id]
    @invoice_id = csv_row_data[:invoice_id]
    @quantity = csv_row_data[:quantity]
    @unit_price = csv_row_data[:unit_price]
    @created_at = csv_row_data[:created_at]
    @updated_at = csv_row_data[:updated_at]
  
  end

  def invoice
  end

  def item
  end

#end of Merchant class
end
