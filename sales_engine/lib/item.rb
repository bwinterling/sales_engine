require 'csv'

class Merchant

  attr_reader :name, :created, :updated

  def initialize(id)
    @name = ""
    @created = ""
    @updated = ""
    filename = '../data/merchants.csv'
    file_data = CSV.read(filename, headers: true, header_converters: :symbol)

    file_data.each do |row|
      if row[:id] == id
        @name << row[:name]
        @created << row[:created_at]
        @updated << row[:updated_at]
      end
    end
  
  end

#end of Merchant class
end
