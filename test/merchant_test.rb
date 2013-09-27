require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'


require_relative '../lib/sales_engine'

class MerchantTest < Minitest::Test

  def merchant
    @merchant ||= SalesEngine.new.merchant_repository.find_by_merchant_id("5")
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

end
