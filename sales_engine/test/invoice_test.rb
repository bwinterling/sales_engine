require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/invoice'

class InvoiceTest < Minitest::Test

  def test_invoice_loaded
    merchant = Merchant.new('1')
    assert_equal 'Schroeder-Jerde', merchant.name
    merchant3 = Merchant.new('3')
    assert_equal '2012-03-27 14:53:59 UTC', merchant3.created
  end

# end of MerchantTest class
end
