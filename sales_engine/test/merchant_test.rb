require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/merchant'

class MerchantTest < Minitest::Test

  def test_merchant_loaded
    merchant = Merchant.new('1')
    assert_equal 'Schroeder-Jerde', merchant.name
    merchant3 = Merchant.new('3')
    assert_equal '2012-03-27 14:53:59 UTC', merchant3.created
  end

# end of MerchantTest class
end
