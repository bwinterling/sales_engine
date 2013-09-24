require 'csv'

class Transaction

  attr_reader :invoice_id, :credit_card_number, :credit_card_expiration_date, :result, :created, :updated

  def initialize(id)

    filename = '../data/transactions.csv'
    file_data = CSV.read(filename, headers: true, header_converters: :symbol)

    transaction = file_data.find { |row| row[:id] == id }

    @invoice_id = transaction[:invoice_id]
    @credit_card_number = transaction[:credit_card_number]
    @credit_card_expiration_date = transaction[:credit_card_expiration_date]
    @result = transaction[:result]
    @created = transaction[:created_at]
    @updated = transaction[:updated_at]
  
  end

#end of Merchant class
end
