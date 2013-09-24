require 'csv'
require_relative 'merchant'
require 'pry'

class MerchantRepository

  attr_reader :merchant_csv, :merchants

  def initialize
    @merchant_csv ||= load_merchant_csv
    @merchants ||= all
  end

  def load_merchant_csv
    CSV.read('../data/merchants.csv', headers: true, header_converters: :symbol)
  end

  def all
    @merchants = @merchant_csv.collect do |row|
      Merchant.new(row)
    end
  end

  def random
    random_id = ""
    total_rows = @merchants.count
    random_id = rand(total_rows).to_s
    random_merchant = @merchants.find { |merchant| merchant.id == random_id }
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


#end of MerchantRepository class
end
