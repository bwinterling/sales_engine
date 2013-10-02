require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/sales_engine'

class SalesEngineTest < Minitest::Test

  def setup
    @engine = SalesEngine.new('test/fixture/')
  end

  def merchant
      @engine.merchant_repository.find_by_id('1')
  end

  def test_merchant_can_list_items
    assert_equal 15, merchant.items.count
  end

  def test_merchant_can_list_invoices
    assert_equal 1, merchant.invoices.count
  end

  def test_merchant_can_list_successful_invoices
    assert_equal 1, merchant.successful_invoices.count
  end

  def test_merchant_can_list_successful_invoice_items
    assert_equal 8, merchant.successful_invoice_items.count
  end

  def test_merchant_can_list_revenue
    assert_equal "12817.94", merchant.revenue.to_s("F")
  end

  def test_merchant_can_list_revenue_date
    date = Date.parse("Tue, 27 Mar 2012")
    assert_equal "12817.94", merchant.revenue(date).to_s("F")
  end

  def invoice_id1
    @invoice ||= @engine.invoice_repository.find_by_id('1')
  end

  def test_invoice_can_list_transactions
    assert_equal 1, invoice_id1.transactions.count
  end

  def test_invoice_can_list_invoice_items
    assert_equal 8, invoice_id1.invoice_items.count
  end

  def test_invoice_can_list_items
    assert_equal 8, invoice_id1.items.count
  end

  def test_invoice_can_list_customer
    invoice = @engine.invoice_repository.find_by_id('10')    
    assert_equal '3', invoice.customer.id
  end

  def test_invoice_can_list_merchant
    assert_equal '26', invoice_id1.merchant.id
  end

  def test_invoice_successful?
    assert invoice_id1.successful?
  end

  def test_invoice_item_can_list_invoice
    invoice_item = @engine.invoice_item_repository.find_by_id('2')
    assert_equal '1', invoice_item.invoice.id
  end

  def test_invoice_item_can_list_item
    invoice_item = @engine.invoice_item_repository.find_by_id('2')
    assert_equal '528', invoice_item.item.id
  end

  def test_item_can_list_invoice_items
    item = @engine.item_repository.items.find { |item| item.id == '1' }
    assert_equal 1, item.invoice_items.count
  end

  def test_item_can_list_merchant
    item = @engine.item_repository.items.find { |item| item.id == "1" }
    assert_equal '1', item.merchant.id
  end

  def test_transaction_can_list_invoice
    transaction = @engine.transaction_repository.transactions.find { |trans| trans.id == ('8') }
    assert_equal '9', transaction.invoice.id
  end

  def test_customer_can_list_invoices
    customer = @engine.customer_repository.customers.find { |cust| cust.id == '3' }
    assert_equal 4, customer.invoices.count
  end

  def test_customer_can_list_transactions
    customer = @engine.customer_repository.customers.find { |cust| cust.id == '3' }
    assert_equal 7, customer.transactions.count
  end

end
