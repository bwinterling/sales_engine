require 'csv'

class Merchant

  attr_reader :id, :name, :created_at, :updated_at

  def initialize(merchant_repository, csv_row_data)
    
    @merchant_repository = merchant_repository
    @id = csv_row_data[:id]
    @name = csv_row_data[:name]
    @created_at = csv_row_data[:created_at]
    @updated_at = csv_row_data[:updated_at]

  end

  def items
    @merchant_repository.find_all_items_by_merchant(@id)
  end

  def invoices
    @merchant_repository.find_all_invoices_by_merchant(@id)
  end

  def successful_invoices
    invoices.find_all { |invoice| invoice.successful? }
  end

  def successful_invoice_items
    results = successful_invoices.collect { |invoice| invoice.invoice_items }
    results.flatten
  end

  def revenue
    total = 0
    successful_invoice_items.each do |invoice_item|
      total += invoice_item.total_sale
    end
    total
  end

end
