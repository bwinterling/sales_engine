require 'csv'
require_relative 'invoice'

class InvoiceRepository

  attr_reader :invoice_csv, :invoices

  def initialize(sales_engine)
    @sales_engine = sales_engine
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

  def find_by_invoice_id(match)
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
    all.find_all { |invoice| Date.parse(invoice.created_at) == date }
  end

  def find_all_transactions_by_invoice(id)
    @sales_engine.transaction_repository.find_all_by_invoice_id(id)
  end

  def find_all_invoice_items_by_invoice(id)
    @sales_engine.invoice_item_repository.find_all_by_invoice_id(id)
  end

  def find_all_items_by_invoice(id)
    invoice_items = find_all_invoice_items_by_invoice(id)
    items = invoice_items.map do |invoice_item|
      @sales_engine.item_repository.find_by_id(invoice_item.item_id)
    end
  end

  def find_customer_by_(customer_id)
    @sales_engine.customer_repository.find_by_customer_id(customer_id)
  end

  def find_merchants_by(merchant_id)
    @sales_engine.merchant_repository.find_by_id(merchant_id)
  end

end

