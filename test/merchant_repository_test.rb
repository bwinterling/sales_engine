require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/sales_engine'

class MerchantRepositoryTest < Minitest::Test

  def setup
    @repository = SalesEngine.new('test/fixture/').merchant_repository
  end

  def test_merchant_repository_all
    refute_nil @repository.merchants
    assert_equal 100, @repository.merchants.count
  end

  def test_merchant_repository_random
    random1 = @repository.random
    random2 = @repository.random
    refute_equal random1, random2
  end

  def test_merchant_repository_find_by_name
    found = @repository.find_by_name('williamson Group')
    assert_equal 'Williamson Group', found.name
    found2 = @repository.find_by_name('Group')
    assert_nil found2
  end

  def test_merchant_repository_find_by_id
    found = @repository.find_by_id('5')
    assert_equal 'Williamson Group', found.name    
  end

  def test_merchant_repository_find_all_by_name
    found = @repository.find_all_by_name('Williamson Group')
    assert_equal 'Williamson Group', found[0].name
    assert_equal 2, found.count
  end

  def test_merchant_repository_most_revenue
    assert_equal 5, @repository.most_revenue(5).count
    assert @repository.most_revenue(5)[0].revenue > @repository.most_items(5)[1].revenue
  end

  def test_merchant_repository_most_items
    assert_equal 5, @repository.most_items(5).count
    assert @repository.most_items(5)[0].items.count > @repository.most_items(5)[1].items.count
  end

  def test_merchant_repository_all_revenue_by_date
    date = Date.parse('27 Mar 2012')
    assert_equal BigDecimal('531107.73'), @repository.revenue(date)
  end

end
