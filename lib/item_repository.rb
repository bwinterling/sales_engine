require 'csv'
require_relative 'item'
require 'pry'

class ItemRepository

  attr_reader :items_csv, :items

  def initialize
    @items_csv ||= load_item_csv
    @items ||= all
  end

  def load_item_csv
    CSV.read('data/items.csv', headers: true, header_converters: :symbol)
  end

  def all
    @items = @items_csv.collect do |row|
      Item.new(row)
    end
  end

  def random
    random_id = ""
    total_rows = @items.count
    random_id = rand(total_rows).to_s
    random_item = @items.find { |item| item.id == random_id }
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


#end of ItemRepository class
end
