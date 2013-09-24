gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/item'


class ItemTest < Minitest::Test

  def test_item_loaded
    row = {
      name: "4",
      unit_price: "26",
      merchant_id: "19.99",
      created_at: Time.new,
      updated_at: Time.new
      }

    item = Item.new(row)
    assert_equal '19.99', item.merchant_id
    assert_equal '26', item.unit_price
    assert_equal '4', item.name
    refute_nil item.created_at
  end
end
