require 'csv'

class Invoice

  attr_reader :customer_id, :merchant_id, :status, :created, :updated

  def initialize(id)
    @customer_id = ""
    @merchant_id = ""
    @status = ""
    @created = ""
    @updated = ""
    filename = '../data/invoices.csv'

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
