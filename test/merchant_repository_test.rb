require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/sales_engine'

class MerchantRepositoryTest < Minitest::Test

  def setup
    @repository = SalesEngine.new.merchant_repository
  end

  def test_merchant_repository_csv_loaded
    refute_nil @repository.merchant_csv
    assert_equal 100, @repository.merchant_csv.count
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

  def test_merchant_repository_find_by_merchant_id
    found = @repository.find_by_merchant_id('5')
    assert_equal 'Williamson Group', found.name    
  end

  def test_merchant_repository_find_all_by_name
    found = @repository.find_all_by_name('Williamson Group')
    assert_equal 'Williamson Group', found[0].name
    assert_equal 2, found.count
  end

# end of MerchantRepositoryTest class
end
