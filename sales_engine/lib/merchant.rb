require 'csv'

class Merchant

  attr_reader :name, :created, :updated

  def initialize(id)
    
    filename = '../data/merchants.csv'
    file_data = CSV.read(filename, headers: true, header_converters: :symbol)

    merchant = file_data.find { |row| row[:id] == id }
    
    @name = merchant[:name]
    @created = merchant[:created_at]
    @updated = merchant[:updated_at]

  end

#end of Merchant class
end
