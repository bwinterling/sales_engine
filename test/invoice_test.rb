gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/sales_engine'


class InvoiceTest < Minitest::Test

  def invoice
    @invoice ||= SalesEngine.new('test/fixture/').invoice_repository.find_by_id('1')
  end

  def test_invoice_has_an_id
    assert_equal "1", invoice.id
  end

  def test_invoice_has_a_customer_id
    assert_equal "1", invoice.customer_id
  end

  def test_invoice_has_a_merchant_id
    assert_equal "26", invoice.merchant_id
  end

  def test_invoice_has_a_status
    assert_equal "shipped", invoice.status
  end

  def test_invoice_has_a_created_at
    refute_nil invoice.created_at
  end

  def test_invoice_items_sold
    assert_equal 47, invoice.items_sold
  end

  def test_invoice_revenue
    assert_equal "21067.77", invoice.revenue.to_s("F")
  end

  def test_successful?
    assert invoice.successful?
  end

  def test_pending?
    refute invoice.pending?
    invoice2 = SalesEngine.new('test/fixture/').invoice_repository.find_by_id('13')
    assert invoice2.pending?
  end

end
