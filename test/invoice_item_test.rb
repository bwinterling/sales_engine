require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/invoice_item'

class InvoiceItemTest < Minitest::Test

  def invoice_item
    @invoice_item ||= SalesEngine.new.invoice_item_repository.find_by_invoice_item_id('2')
  end

  def test_invoice_item_has_id
    assert_equal '2', invoice_item.id
  end  

  def test_invoice_item_has_item_id
    assert_equal '528', invoice_item.item_id
  end  

  def test_invoice_item_has_invoice_id
    assert_equal '1', invoice_item.invoice_id
  end  

  def test_invoice_item_has_quantity
    assert_equal '9', invoice_item.quantity
  end  

  def test_invoice_item_has_unit_price
    assert_equal '23324', invoice_item.unit_price
  end  

  def test_invoice_item_has_created_at
    refute_nil invoice_item.created_at
  end

end
