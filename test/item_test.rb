gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/item'


class ItemTest < Minitest::Test

  def sample_data
    {
      id: "1",
      name: "4",
      unit_price: "26",
      merchant_id: "19.99",
      created_at: Time.new,
      updated_at: Time.new
    }
  end

  def item
    @item ||= Item.new(sample_data)
  end

  def test_item_has_an_item_id
    assert_equal "1", item.id
  end

  def test_item_has_a_name
    assert_equal '4', item.name
  end

  def test_item_has_a_unit_price
    assert_equal '26', item.unit_price
  end

  def test_item_has_a_merchant_id
    assert_equal '19.99', item.merchant_id
  end

  def test_item_has_a_created_at
    refute_nil item.created_at
  end

end
