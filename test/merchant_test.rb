require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/merchant'

class MerchantTest < Minitest::Test

  def test_merchant_loaded
    row = {
      id: '1',
      name: "George",
      created_at: Time.new,
      updated_at: Time.new
    }

    merchant = Merchant.new(row)
    assert_equal 'George', merchant.name
    assert_equal '1', merchant.id
    refute_nil merchant.created_at
  end

# end of MerchantTest class
end
