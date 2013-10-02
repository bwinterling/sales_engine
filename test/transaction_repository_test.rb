require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/sales_engine'

class TransactionRepositoryTest < Minitest::Test

  def setup
    @repository = SalesEngine.new('test/fixture/').transaction_repository
  end

  def test_transaction_repository_all
    refute_nil @repository.transactions
    assert_equal 5595, @repository.transactions.count
  end

  def test_transaction_repository_random
    random1 = @repository.random
    random2 = @repository.random
    refute_equal random1, random2
  end

  def test_find_by_transaction_id
    found = @repository.find_by_transaction_id('5')
    assert_equal '6', found.invoice_id 
  end

  def test_find_by_invoice_id
    found = @repository.find_by_invoice_id('5')
    assert_equal '4', found.id 
  end

  def test_find_all_by_invoice_id
    found = @repository.find_all_by_invoice_id('12')
    assert_equal 3, found.count
  end

  def test_find_by_credit_card_number
    found = @repository.find_by_credit_card_number('4515551623735607')
    assert_equal '5', found.invoice_id
  end

  def test_find_all_by_credit_card_number
    found = @repository.find_all_by_credit_card_number('4515551623735607')
    assert_equal 1, found.count
  end

  def test_find_by_result
    found = @repository.find_by_result('failed')
    refute_equal 'success', found.result
  end

  def test_find_all_by_result
    found = @repository.find_all_by_result('failed')
    assert_equal 947, found.count  
  end

end
