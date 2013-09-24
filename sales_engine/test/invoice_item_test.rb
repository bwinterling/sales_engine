require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/invoice_item'

class InvoiceItemTest < Minitest::Test

  def test_invoice_item_item_id
    invoice_item = InvoiceItem.new('1')
    assert_equal '539', invoice_item.item_id
  end

  def test_invoice_item_invoice_id
    invoice_item2 = InvoiceItem.new('2')
    assert_equal '1', invoice_item2.invoice_id
  end

  def test_invoice_item_quantity
    invoice_item9 = InvoiceItem.new('9')
    assert_equal '6', invoice_item9.quantity
  end  

end
