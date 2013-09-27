require 'csv'
require_relative 'merchant'

class MerchantRepository

  attr_reader :merchant_csv, :merchants

  def initialize(sales_engine)
    @sales_engine = sales_engine
    @merchant_csv ||= load_merchant_csv
    @merchants ||= all
  end

  def load_merchant_csv
    CSV.read('data/merchants.csv', headers: true, header_converters: :symbol)
  end

  def all
    @merchants = @merchant_csv.collect do |row|
      Merchant.new(self, row)
    end
  end

  def random
    @merchants.sample
  end

  def find_by_name(match)
    @merchants.find { |merchant| merchant.name.downcase == match.downcase }
  end

  def find_all_by_name(match)
    @merchants.find_all { |merchant| merchant.name.downcase == match.downcase }
  end

  def find_by_merchant_id(match)
    @merchants.find { |merchant| merchant.id == match }
  end

  def find_all_items_by_merchant(merchant_id)
    @sales_engine.item_repository.items.find_all { |item| item.merchant_id == merchant_id }
  end

  def find_all_invoices_by_merchant(merchant_id)
    @sales_engine.invoice_repository.invoices.find_all { |invoice| invoice.merchant_id == merchant_id }
  end
end
