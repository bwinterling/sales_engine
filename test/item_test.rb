gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'bigdecimal'

require_relative '../lib/sales_engine'


class ItemTest < Minitest::Test

  def item
    @item ||= SalesEngine.new('test/fixture/').item_repository.find_by_id('1')
  end

  def item2
    @item2 ||= SalesEngine.new.item_repository.find_by_id('848')
  end

  def test_item_has_an_item_id
    assert_equal "1", item.id
  end

  def test_item_has_a_name
    assert_equal 'Item Qui Esse', item.name
  end

  def test_item_has_a_unit_price
    assert_equal BigDecimal('75107'), item.unit_price
  end

  def test_item_has_a_merchant_id
    assert_equal '1', item.merchant_id
  end

  def test_item_has_a_created_at
    refute_nil item.created_at
  end

  def test_item_total_sold
    assert_equal 37, item.total_sold
  end

  def test_item_revenue
    test = BigDecimal('12817.94')
    assert_equal test, item.revenue
  end

  def test_item_revenue_by_date
    test = BigDecimal('53238.94')
    date = Date.parse('2012-03-27')
    assert_equal test, item2.revenue(date)
  end

  def test_best_day
    date = Date.parse('2012-03-25')
    assert_equal date, item.best_day

  end

end
