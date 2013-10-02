require 'csv'
require_relative 'item'
require 'pry'

class ItemRepository

  def initialize(sales_engine)
    @sales_engine = sales_engine
  end

  def data
    CSV.read(data_file, headers: true, header_converters: :symbol)
  end

  def data_file
    "#{@sales_engine.dir}items.csv"
  end

  def items
    all
  end

  def all
    @all ||= data.collect { |row| Item.new(self, row) }
  end

  def random
    all.sample
  end

  def find_by_name(match)
    all.find { |item| item.name.downcase == match.downcase }
  end

  def find_all_by_name(match)
    all.find_all { |item| item.name.downcase == match.downcase }
  end

  def find_by_id(match)
    all.find { |item| item.id == match }
  end

  def find_by_merchant_id(match)
    all.find { |item| item.merchant_id == match }
  end

  def find_invoice_items_by(item_id)
    @sales_engine.invoice_item_repository.find_all_by_item_id(item_id)
  end

  def find_merchant_by(merchant_id)
    @sales_engine.merchant_repository.find_by_id(merchant_id)
  end

  def most_revenue(top_x)
    items_by_rev = items.sort_by { |i| -i.revenue }
    items_by_rev[0...top_x]
  end

  def most_items(top_x)
    items_by_total_sold = items.sort_by { |i| -i.total_sold }
    items_by_total_sold[0...top_x]
  end

end
