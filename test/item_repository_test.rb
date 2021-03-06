require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/sales_engine'

class ItemRepositoryTest < Minitest::Test

  def setup
    @repository = SalesEngine.new('test/fixture/').item_repository
  end

  def test_item_repository_all
    refute_nil @repository.all
    assert_equal 2483, @repository.all.count
  end

  def test_item_repository_random
    random1 = @repository.random
    random2 = @repository.random
    refute_equal random1, random2
  end

  def test_item_repository_find_by_name
    found = @repository.find_by_id('4')
    assert_equal 'Item Nemo Facere', found.name
  end

  def test_item_repository_find_by_merchant_id
    found = @repository.find_by_merchant_id('2')
    assert_equal '16', found.id 
  end

  def test_item_repository_find_all_by_name
    found = @repository.find_all_by_name('Item Qui Esse')
    assert_equal 'Item Qui Esse', found[0].name
    assert_equal 1, found.count
  end

  def test_item_repository_most_revenue
    list = @repository.most_revenue(5)
    assert_equal 5, list.count
    assert list[0].revenue >= list[1].revenue
  end

  def test_item_repository_most_items
    list = @repository.most_items(5)
    assert_equal 5, list.count
    assert list[0].total_sold >= list[1].total_sold
  end

end
