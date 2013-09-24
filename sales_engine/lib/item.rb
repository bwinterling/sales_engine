require 'csv'


class Item

  attr_reader :id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at


  def initialize(id)

    filename = "../data/items.csv"
    file_data =  CSV.read(filename, headers: true, header_converters: :symbol)

    item = file_data.find { |row| row[:id] == id  }

    @name = item[:name]
    @description = item[:description]
    @unit_price = item[:unit_price]
    @merchant_id = item[:merchant_id]
    @created_at = item[:created_at]
    @updated_at = item[:updated_at]
      
  end

end

