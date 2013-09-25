require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/invoice_item'

class InvoiceItemTest < Minitest::Test

  def sample_date
    {
      id: "2",
      item_id: "6",
      invoice_id: "4",
      quantity: "26",
      unit_price: "19.99",
      created_at: Time.new,
      updated_at: Time.new
      }
  end

  def invoice_item
    @invoice_item ||= InvoiceItem.new(sample_date)
  end

  def test_invoice_item_has_id
    assert_equal '2', invoice_item.id
  end  

  def test_invoice_item_has_item_id
    assert_equal '6', invoice_item.item_id
  end  

  def test_invoice_item_has_invoice_id
    assert_equal '4', invoice_item.invoice_id
  end  

  def test_invoice_item_has_quantity
    assert_equal '26', invoice_item.quantity
  end  

  def test_invoice_item_has_unit_price
    assert_equal '19.99', invoice_item.unit_price
  end  

  def test_invoice_item_has_created_at
    refute_nil invoice_item.created_at
  end

end
