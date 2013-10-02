require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'


require_relative '../lib/sales_engine'

class MerchantTest < Minitest::Test

  def merchant
    @merchant ||= SalesEngine.new('test/fixture/').merchant_repository.find_by_id("5")
  end

  def merchant34
    @merchant34 ||= SalesEngine.new('test/fixture/').merchant_repository.find_by_id("34")
  end  

  def test_merchant_has_an_id
    assert_equal '5', merchant.id
  end

  def test_merchant_has_a_name
    assert_equal 'Williamson Group', merchant.name
  end

  def test_merchant_has_a_created_at
    refute_nil merchant.created_at
  end

  def test_pending_invoices
    refute_nil merchant34.pending_invoices
  end

  def test_customers_with_pending_invoices
    assert_equal 1, merchant34.customers_with_pending_invoices.count
  end

  def test_favorite_customer
    merch = SalesEngine.new.merchant_repository.find_by_id("2")
    assert_equal '289', merch.favorite_customer.id
  end

end
