require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/merchant_repository'

class MerchantRepositoryTest < Minitest::Test

  def test_merchant_repository_csv_loaded
    repository = MerchantRepository.new
    refute_nil repository.merchant_csv
    assert_equal 100, repository.merchant_csv.count
  end

  def test_merchant_repository_all
  end

  def test_merchant_repository_random
  end

  def test_merchant_repository_find_by_name
  end

  def test_merchant_repository_find_by_merchant_id
  end

  def test_merchant_repository_find_all_by_name
  end

  def test_merchant_repository_find_all_by_merchant_id
  end  

# end of MerchantRepositoryTest class
end
