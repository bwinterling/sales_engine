require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/sales_engine'

class SalesEngineTest < Minitest::Test

  def setup
    @engine = SalesEngine.new
    @engine.startup
  end

  def test_merchant_can_list_items
    merchant = @engine.merchant_repository.merchants.find { |merchant| merchant.id == "1" }
    assert_equal 15, merchant.items.count
  end

  def test_merchant_can_list_invoices
    merchant = @engine.merchant_repository.merchants.find { |merchant| merchant.id == "1" }
    assert_equal 59, merchant.invoices.count
  end

  def test_invoice_can_list_transactions
    invoice = @engine.invoice_repository.invoices.find { |invoice| invoice.id == "1" }
    assert_equal 1, invoice.transactions.count
  end

  def test_invoice_can_list_invoice_items
    invoice = @engine.invoice_repository.invoices.find { |invoice| invoice.id == "1" }
    assert_equal 8, invoice.invoice_items.count
  end

  def test_invoice_can_list_items
    invoice = @engine.invoice_repository.invoices.find { |invoice| invoice.id == "1" }
    assert_equal 8, invoice.items.count
  end

  def test_invoice_can_list_customer
    invoice = @engine.invoice_repository.invoices.find { |invoice| invoice.id == "10" }
    assert_equal '3', invoice.customer.id
  end

  def test_invoice_can_list_merchant
    invoice = @engine.invoice_repository.invoices.find { |invoice| invoice.id == "1" }
    assert_equal '26', invoice.merchant.id
  end

  def test_invoice_item_can_list_invoice
    invoice_item = @engine.invoice_item_repository.invoice_items.find { |ii| ii.id =='2' }
    assert_equal '1', invoice_item.invoice.id
  end

  def test_invoice_item_can_list_item
    invoice_item = @engine.invoice_item_repository.invoice_items.find { |ii| ii.id =='2' }
    assert_equal '528', invoice_item.item.id
  end

  def test_item_can_list_invoice_items
    item = @engine.item_repository.items.find { |item| item.id == '1' }
    assert_equal 24, item.invoice_items.count
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

end
