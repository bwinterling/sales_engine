require 'csv'
require_relative 'invoice_item'

class InvoiceItemRepository

  def initialize(sales_engine)
    @sales_engine = sales_engine
  end

  def data
    CSV.read(data_file, headers: true, header_converters: :symbol)
  end

  def data_file
    "#{@sales_engine.dir}invoice_items.csv"
  end

  def invoice_items
    all
  end

  def all
    @all ||= data.collect { |row| InvoiceItem.new(self, row) }
  end

  def random
    all.sample
  end

  def find_by_id(match)
    all.find { |invoice_item| invoice_item.id == match }
  end

  def find_by_item_id(match)
    all.find { |invoice_item| invoice_item.item_id == match }
  end

  def find_all_by_item_id(match)
    all.find_all { |invoice_item| invoice_item.item_id == match }   
  end

  def find_by_invoice_id(match)
    all.find { |invoice_item| invoice_item.invoice_id == match }
  end

  def find_all_by_invoice_id(match)
    all.find_all { |invoice_item| invoice_item.invoice_id == match }   
  end

  def find_by_quantity(match)
    all.find { |invoice_item| invoice_item.quantity == match }
  end

  def find_all_by_quantity(match)
    all.find_all { |invoice_item| invoice_item.quantity == match }   
  end

  def find_by_unit_price(match)
    all.find { |invoice_item| invoice_item.unit_price == match }
  end

  def find_all_by_unit_price(match)
    all.find_all { |invoice_item| invoice_item.unit_price == match }   
  end    

  def find_invoice_by(invoice_id)
    @sales_engine.invoice_repository.find_by_id(invoice_id)
  end

  def find_item_by(item_id)
    @sales_engine.item_repository.find_by_id(item_id)
  end

end
