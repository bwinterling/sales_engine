require 'csv'
require 'bigdecimal'

require_relative 'merchant'

class MerchantRepository

  def initialize(sales_engine)
    @sales_engine = sales_engine
  end

  def data
    CSV.read(data_file, headers: true, header_converters: :symbol)
  end

  def data_file
    "#{@sales_engine.dir}merchants.csv"
  end

  def merchants
    all
  end

  def all
    @all ||= data.collect { |row| Merchant.new(self, row) }
  end

  def random
    all.sample
  end

  def find_by_name(match)
    all.find { |merchant| merchant.name.downcase == match.downcase }
  end

  def find_all_by_name(match)
    all.find_all { |merchant| merchant.name.downcase == match.downcase }
  end

  def find_by_id(match)
    all.find { |merchant| merchant.id == match }
  end

  def find_all_items_by_id(merchant_id)
    @sales_engine.item_repository.items.find_all { |item| item.merchant_id == merchant_id }
  end

  def find_all_invoices_by_id(merchant_id)
    @sales_engine.invoice_repository.invoices.find_all { |invoice| invoice.merchant_id == merchant_id }
  end

  def most_revenue(count)
    merchants_by_rev = merchants.sort_by { |merch| -merch.revenue }
    merchants_by_rev[0...count]
  end

  def most_items(count)
    merchants_by_item = merchants.sort_by { |merch| -merch.items.count }
    merchants_by_item[0...count]
  end

  def revenue(date)
    total = BigDecimal('0')
    all.each do |merchant|
      total = total + merchant.revenue(date)
    end
    total
  end

end
