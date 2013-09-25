require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/merchant'

class MerchantTest < Minitest::Test

  def sample_date
    {
      id: '1',
      name: "George",
      created_at: Time.new,
      updated_at: Time.new
    }
  end

  def merchant
    @merchant ||= Merchant.new(sample_date)
  end

  def test_merchant_has_an_id
    assert_equal '1', merchant.id
  end

  def test_merchant_has_a_name
    assert_equal 'George', merchant.name
  end

  def test_merchant_has_a_created_at
    refute_nil merchant.created_at
  end

end
