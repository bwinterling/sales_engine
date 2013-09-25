require 'csv'
require_relative 'invoice_item'

class InvoiceItemRepository

  attr_reader :invoice_items_csv, :invoice_items

  def initialize
    load_invoice_items_csv
    @invoice_items ||= all
  end

  def load_invoice_items_csv
    @invoice_items_csv ||= CSV.read('data/invoice_items.csv', headers: true, header_converters: :symbol)
  end

  def all
    @invoice_items = @invoice_items_csv.collect { |row| InvoiceItem.new(row) }
  end

  def random
    random_id = ""
    total_rows = @invoice_items.count
    random_id = rand(total_rows).to_s
    random_invoice_item = @invoice_items.find { |invoice_item| invoice_item.id == random_id }
  end

  def find_by_invoice_item_id(match)
    @invoice_items.find { |invoice_item| invoice_item.id == match }
  end

  def find_by_item_id(match)
    @invoice_items.find { |invoice_item| invoice_item.item_id == match }
  end

  def find_all_by_item_id(match)
    @invoice_items.find_all { |invoice_item| invoice_item.item_id == match }   
  end

  def find_by_invoice_id(match)
    @invoice_items.find { |invoice_item| invoice_item.invoice_id == match }
  end

  def find_all_by_invoice_id(match)
    @invoice_items.find_all { |invoice_item| invoice_item.invoice_id == match }   
  end

  def find_by_quantity(match)
    @invoice_items.find { |invoice_item| invoice_item.quantity == match }
  end

  def find_all_by_quantity(match)
    @invoice_items.find_all { |invoice_item| invoice_item.quantity == match }   
  end

  def find_by_unit_price(match)
    @invoice_items.find { |invoice_item| invoice_item.unit_price == match }
  end

  def find_all_by_unit_price(match)
    @invoice_items.find_all { |invoice_item| invoice_item.unit_price == match }   
  end    

end
