require 'csv'

class Customer

  attr_reader :id, :first_name, :last_name, :created_at, :updated_at

  def initialize(csv_row_data)

    @id = csv_row_data[:id]
    @first_name = csv_row_data[:first_name]
    @last_name = csv_row_data[:last_name]
    @created_at = csv_row_data[:created_at]
    @updated_at = csv_row_data[:updated_at]
  
  end

  def invoices
    
  end

#end of Customer class
end
