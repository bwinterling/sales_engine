require 'csv'
require_relative 'item'
require 'pry'

class ItemRepository

  attr_reader :items_csv, :items

  def initialize(sales_engine)
    @sales_engine = sales_engine
    @items_csv ||= load_item_csv
    @items ||= all
  end

  def load_item_csv
    CSV.read('data/items.csv', headers: true, header_converters: :symbol)
  end

  def all
    @items = @items_csv.collect do |row|
      Item.new(self, row)
    end
  end

  def random
    @items.sample
  end

  def find_by_name(match)
    @items.find { |item| item.name.downcase == match.downcase }
  end

  def find_all_by_name(match)
    @items.find_all { |item| item.name.downcase == match.downcase }
  end

  def find_by_item_id(match)
    @items.find { |item| item.id == match }
  end

  def find_by_merchant_id(match)
    @items.find { |item| item.merchant_id == match }
  end

  def find_invoice_items_by(item_id)
    @sales_engine.invoice_item_repository.find_all_by_item_id(item_id)
  end

  def find_merchant_by(merchant_id)
    @sales_engine.merchant_repository.find_by_merchant_id(merchant_id)
  end

end
