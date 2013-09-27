require 'csv'


class Item

  attr_reader :id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at


  def initialize(item_repository, csv_row_data)

    @item_repository = item_repository
    @id = csv_row_data[:id]
    @name = csv_row_data[:name]
    @description = csv_row_data[:description]
    @unit_price = csv_row_data[:unit_price]
    @merchant_id = csv_row_data[:merchant_id]
    @created_at = csv_row_data[:created_at]
    @updated_at = csv_row_data[:updated_at]
      
  end

  def invoice_items
    @item_repository.find_invoice_items_by(@id)
  end

  def merchant
    @item_repository.find_merchant_by(@merchant_id)
  end

end

