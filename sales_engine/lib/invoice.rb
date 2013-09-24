require 'csv'


class Invoice

  attr_reader :id, :customer_id, :merchant_id, :status, :created_at, :updated_at

  def initialize(id)
    
    filename = "../data/invoices.csv"
    file_data =  CSV.read(filename, headers: true, header_converters: :symbol)

    invoice = file_data.find { |row| row[:id] == id  }
      
    @customer_id = invoice[:customer_id]
    @merchant_id = invoice[:merchant_id]
    @status = invoice[:status]
    @created_at = invoice[:created_at]
    @updated_at = invoice[:updated_at]
      
    

end

