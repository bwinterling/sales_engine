require 'csv'

class Merchant

  attr_reader :merchant_id, :name, :created, :updated

  def initialize(csv_row_data)
    
    @merchant_id = csv_row_data[:id]
    @name = csv_row_data[:name]
    @created = csv_row_data[:created_at]
    @updated = csv_row_data[:updated_at]

  end

  def items
    #find all items with merchant_id 
  end
#end of Merchant class
end
