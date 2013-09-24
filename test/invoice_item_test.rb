require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/invoice_item'

class InvoiceItemTest < Minitest::Test

  def test_invoice_item_loaded
    row = {
      item_id: "6",
      invoice_id: "4",
      quantity: "26",
      unit_price: "19.99",
      created_at: Time.new,
      updated_at: Time.new
      }

    invoice_item = InvoiceItem.new(row)
    assert_equal '19.99', invoice_item.unit_price
    assert_equal '26', invoice_item.quantity
    assert_equal '4', invoice_item.invoice_id
    assert_equal '6', invoice_item.item_id
    refute_nil invoice_item.created_at
  end

end
