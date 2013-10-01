require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/customer_repository'

class CustomerRepositoryTest < Minitest::Test

  def setup
    @repository = SalesEngine.new('test/fixture/').customer_repository
  end

  def test_customer_repository_all
    refute_nil @repository.customers
    assert_equal 20, @repository.customers.count
  end

  def test_customer_repository_random
    random1 = @repository.random
    random2 = @repository.random
    refute_equal random1, random2
  end

  def test_customer_repository_find_by_customer_id
    found = @repository.find_by_customer_id('5')
    assert_equal 'Sylvester', found.first_name    
  end

  def test_customer_repository_find_by_first_name
    found = @repository.find_by_first_name('Leanne')
    assert_equal 'Leanne', found.first_name
    found2 = @repository.find_by_first_name('Snuffalufagus')
    assert_nil found2
  end

  def test_customer_repository_find_all_by_first_name
    found = @repository.find_all_by_first_name('Leanne')
    assert_equal 1, found.count
  end


  def test_customer_repository_find_by_last_name
    found = @repository.find_by_last_name('Nader')
    assert_equal 'Nader', found.last_name
    found2 = @repository.find_by_last_name('Snuffalufagus')
    assert_nil found2
  end

  def test_customer_repository_find_all_by_last_name
    found = @repository.find_all_by_last_name('Fadel')
    assert_equal 2, found.count
  end

end
