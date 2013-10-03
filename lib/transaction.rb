require 'csv'

class Transaction

  attr_reader :id, :invoice_id, :credit_card_number,
    :credit_card_expiration_date, :result, :created_at, :updated_at,
    :transaction_repository

  def initialize(transaction_repository, csv_row_data)

    @transaction_repository = transaction_repository
    @id = csv_row_data[:id]
    @invoice_id = csv_row_data[:invoice_id]
    @credit_card_number = csv_row_data[:credit_card_number]
    @credit_card_expiration_date = csv_row_data[:credit_card_expiration_date]
    @result = csv_row_data[:result]
    @created_at = Date.parse(csv_row_data[:created_at])
    @updated_at = Date.parse(csv_row_data[:updated_at])

  end

  def invoice
    transaction_repository.find_invoice_by(@invoice_id)
  end

#end of Merchant class
end
