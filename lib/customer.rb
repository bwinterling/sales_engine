require 'csv'

class Customer

  attr_reader :first_name, :last_name, :created, :updated

  def initialize(id)

    filename = '../data/customers.csv'
    file_data = CSV.read(filename, headers: true, header_converters: :symbol)

    customer = file_data.find { |row| row[:id] == id }

    @first_name = customer[:first_name]
    @last_name = customer[:last_name]
    @created = customer[:created_at]
    @updated = customer[:updated_at]
  
  end

#end of Merchant class
end
