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
    @merchant_repository.find_all_items_by_id(@id)
  end

  def invoices
    @merchant_repository.find_all_invoices_by_id(@id)
  end

  def customers
    invoices.collect { |i| i.customer }.uniq
  end

  def successful_invoices
    invoices.find_all { |invoice| invoice.successful? }
  end

  def pending_invoices
    invoices.find_all { |invoice| invoice.pending? }
  end

  def successful_invoice_items
    results = successful_invoices.collect { |invoice| invoice.invoice_items }
    results.flatten
  end

  def successful_invoices_by_customer
    successful_invoices.group_by { |i| i.customer }
  end

  def customers_with_pending_invoices
    customers.find_all { |c| c.has_pending_invoices? }
  end

  def favorite_customer
    customers.max_by { |c| c.successful_invoices.count }
  end

  def revenue(date = 'all')
    total = 0
    if date == 'all'
      successful_invoice_items.each do |ii|
        total += ii.total_sale
      end
    else
      successful_invoice_items.each do |ii|
        total += ii.total_sale if date == Date.parse(ii.created_at[0..9])
      end
    end
    to_big_dec(total)
  end

  def to_big_dec(integer)
    string = (integer / 100.0).to_s
    BigDecimal(string)
  end

end
