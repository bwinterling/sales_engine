require 'csv'
require 'bigdecimal'

class Item

  attr_reader :id, :name, :description, :unit_price, :merchant_id,
    :created_at, :updated_at

  def initialize(item_repository, csv_row_data)
    @item_repository = item_repository
    @id = csv_row_data[:id]
    @name = csv_row_data[:name]
    @description = csv_row_data[:description]
    @unit_price = BigDecimal(csv_row_data[:unit_price])
    @merchant_id = csv_row_data[:merchant_id]
    @created_at = Date.parse(csv_row_data[:created_at])
    @updated_at = Date.parse(csv_row_data[:updated_at])
  end

  def merchant
    @item_repository.find_merchant_by(@merchant_id)
  end

  def invoice_items
    @item_repository.find_invoice_items_by(@id)
  end

  def invoices
    invoice_items.collect { |ii| ii.invoice }.uniq
  end

  def successful_invoices
    invoices.find_all { |i| i.successful? }
  end

  def total_sold
    total = 0
    successful_invoices.each { |si| total += si.items_sold }
    total
  end

  def revenue(date = 'all')
    total = BigDecimal('0')
    if date == 'all'
      successful_invoices.each { |si| total += si.revenue }
    else
      successful_invoices.each {
        |si| total += si.revenue if date == si.created_at
      }
    end
    total
  end

  def best_day
    dates = successful_invoices.collect { |si| si.created_at }.uniq
    dates.max_by { |date| revenue(date) }
  end

end

