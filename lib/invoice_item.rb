require 'csv'
require 'bigdecimal'

class InvoiceItem

  attr_reader :id, :item_id, :invoice_id, :quantity, :unit_price,
    :created_at, :updated_at, :invoice_item_repository

  def initialize(invoice_item_repository, csv_row_data)
    @invoice_item_repository = invoice_item_repository
    @id = csv_row_data[:id]
    @item_id = csv_row_data[:item_id]
    @invoice_id = csv_row_data[:invoice_id]
    @quantity = csv_row_data[:quantity]
    @unit_price = BigDecimal(csv_row_data[:unit_price])
    @created_at = Date.parse(csv_row_data[:created_at])
    @updated_at = Date.parse(csv_row_data[:updated_at])
  end

  def invoice
    invoice_item_repository.find_invoice_by(invoice_id)
  end

  def item
    invoice_item_repository.find_item_by(item_id)
  end

  def total_sale
    quantity.to_i * unit_price
  end

end
