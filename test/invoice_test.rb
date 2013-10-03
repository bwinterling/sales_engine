gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/sales_engine'


class InvoiceTest < Minitest::Test

  def sales_engine
    @sales_engine ||= SalesEngine.new('test/fixture/')
  end

  def invoice
    @invoice ||= sales_engine.invoice_repository.find_by_id('1')
  end

  def invoice2
    @invoice2 ||= sales_engine.invoice_repository.find_by_id('13')
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
    assert invoice2.pending?
  end

  def test_charge
    input_hash = {
      credit_card_number: "4444333322221111",
      credit_card_epiration_date: "10/13",
      result: "success"
    }
    start_t_count = sales_engine.transaction_repository.all.count
    invoice2.charge(input_hash)
    finish_t_count = sales_engine.transaction_repository.all.count
    assert finish_t_count == (start_t_count + 1)
    assert_equal "4444333322221111", sales_engine.transaction_repository.all.last.credit_card_number
  end

end
