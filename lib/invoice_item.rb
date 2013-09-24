require 'csv'

class InvoiceItem

  attr_reader :item_id, :invoice_id, :quantity, :unit_price, :created, :updated

  def initialize(id)

    filename = '../data/invoice_items.csv'
    file_data = CSV.read(filename, headers: true, header_converters: :symbol)

    invoice_item = file_data.find { |row| row[:id] == id }

    @item_id = invoice_item[:item_id]
    @invoice_id = invoice_item[:invoice_id]
    @quantity = invoice_item[:quantity]
    @unit_price = invoice_item[:unit_price]
    @created = invoice_item[:created_at]
    @updated = invoice_item[:updated_at]
  
  end

#end of Merchant class
end
