require 'csv'

class MerchantRepository

  attr_reader :merchant_csv

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
  end

  def find_by_name
  end

  def find_all_by_name
  end

  def find_by_merchant_id
  end

  def find_all_by_merchant_id
  end


#end of MerchantRepository class
end
