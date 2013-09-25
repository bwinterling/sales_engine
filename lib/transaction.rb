require 'csv'

class Transaction

  attr_reader :invoice_id, :credit_card_number, :credit_card_expiration_date, :result, :created_at, :updated_at

  def initialize(csv_row_data)

    @invoice_id = csv_row_data[:invoice_id]
    @credit_card_number = csv_row_data[:credit_card_number]
    @credit_card_expiration_date = csv_row_data[:credit_card_expiration_date]
    @result = csv_row_data[:result]
    @created_at = csv_row_data[:created_at]
    @updated_at = csv_row_data[:updated_at]
  
  end

  def invoice
  end

#end of Merchant class
end
