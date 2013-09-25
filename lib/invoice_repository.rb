require 'csv'
require_relative 'invoice'

class InvoiceRepository

  attr_reader :invoice_csv, :invoice

  def initialize
    @invoice_csv ||= load_invoice_csv
    @invoice ||= all
  end

  def load_invoice_csv
    CSV.read("data/invoices.csv", headers: true, header_converters: :symbol)
  end

  def all
    @invoice = @invoice_csv.collect do |row|
      Invoice.new(row)
    end
  end

  def random
    random_id = ""
    total_rows = @invoice.count
    random_id = rand(total_rows).to_s
    random_merchant = @invoice.find { |invoice| invoice.id == random_id }
  end

  def find_by_invoice_id(match)
    @invoice.find { |invoice| invoice.id == match }
  end

  def find_by_customer_id(match)
    @invoice.find { |invoice| invoice.customer_id == match }
  end

  def find_by_merchant_id(match)
    @invoice.find { |invoice| invoice.merchant_id == match }
  end

  def find_all_by_merchant_id(match)
    @invoice.find_all { |invoice| invoice.merchant_id == match }
  end

  def find_all_by_customer_id(match)
    @invoice.find_all { |invoice| invoice.customer_id == match }
  end

  def find_by_status(match)
    @invoice.find { |invoice| invoice.status.downcase == match.downcase }
  end

  def find_all_by_status(match)
    @invoice.find_all { |invoice| invoice.status.downcase == match.downcase }
  end


#end of MerchantRepository class
end

