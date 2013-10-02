require 'csv'
require_relative 'invoice'

class InvoiceRepository

  attr_reader :invoice_csv, :invoices

  def initialize(sales_engine)
    @sales_engine = sales_engine
  end

  def invoice_item_repository
    @invoice_item_repository ||= @sales_engine.invoice_item_repository
  end

  def data
    CSV.read(data_file, headers: true, header_converters: :symbol)
  end

  def data_file
    "#{@sales_engine.dir}invoices.csv"
  end

  def invoices
    all
  end

  def all
    @all ||= data.collect { |row| Invoice.new(self, row) }
  end

  def random
    all.sample
  end

  def find_by_id(match)
    all.find { |invoice| invoice.id == match }
  end

  def find_by_customer_id(match)
    all.find { |invoice| invoice.customer_id == match }
  end

  def find_by_merchant_id(match)
    all.find { |invoice| invoice.merchant_id == match }
  end

  def find_all_by_merchant_id(match)
    all.find_all { |invoice| invoice.merchant_id == match }
  end

  def find_all_by_customer_id(match)
    all.find_all { |invoice| invoice.customer_id == match }
  end

  def find_by_status(match)
    all.find { |invoice| invoice.status.downcase == match.downcase }
  end

  def find_all_by_status(match)
    all.find_all { |invoice| invoice.status.downcase == match.downcase }
  end

  def find_all_by_date(date)
    all.find_all { |invoice| invoice.created_at == date }
  end

  def find_all_transactions_by_invoice(id)
    @sales_engine.transaction_repository.find_all_by_invoice_id(id)
  end

  def find_all_invoice_items_by_invoice(id)
    invoice_item_repository.find_all_by_invoice_id(id)
  end

  def find_all_items_by_invoice(id)
    invoice_items = find_all_invoice_items_by_invoice(id)
    items = invoice_items.map do |invoice_item|
      @sales_engine.item_repository.find_by_id(invoice_item.item_id)
    end
  end

  def find_customer_by_(customer_id)
    @sales_engine.customer_repository.find_by_id(customer_id)
  end

  def find_merchants_by(merchant_id)
    @sales_engine.merchant_repository.find_by_id(merchant_id)
  end

  def create(input_hash)
    new_invoice = Invoice.new(self, create_row(input_hash))
    @all << new_invoice
    process_items_array(input_hash, new_invoice.id)  
  end

  def create_row(input_hash)
    next_id = (all.count + 1).to_s
    row = {
      id:           next_id,
      customer_id:  input_hash[:customer].id,
      merchant_id:  input_hash[:merchant].id,
      status:       input_hash[:status],
      created_at:   Date.today.to_s,
      updated_at:   Date.today.to_s
    }
  end

  def process_items_array(input_hash, new_invoice_id)
    items_array = input_hash[:items]
    unique_items = items_array.uniq
    unique_items.each do |ui|
      create_invoice_item(ui, new_invoice_id, items_array.count(ui))
    end
  end

  def create_invoice_item(item, inv_id, qty)
    row = {
      id:           (invoice_item_repository.all.count + 1).to_s,
      item_id:      item.id,
      invoice_id:   inv_id,
      quantity:     qty,
      unit_price:   item.unit_price,
      created_at:   Date.today.to_s,
      updated_at:   Date.today.to_s
    }
    invoice_item_repository.all << InvoiceItem.new(invoice_item_repository, row)
  end

end

