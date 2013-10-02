require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/sales_engine'

class InvoiceRepositoryTest < Minitest::Test

  def setup
    @repository = SalesEngine.new('test/fixture/').invoice_repository
  end

  def test_invoice_repository_all
    refute_nil @repository.invoices
    assert_equal 47, @repository.invoices.count
  end

  def test_invoice_repository_random
    random1 = @repository.random
    random2 = @repository.random
    refute_equal random1, random2
  end

  def test_invoice_repository_find_by_invoice_id
    found = @repository.find_by_invoice_id('7')
    assert_equal '44', found.merchant_id
  end

  def test_invioce_repository_find_by_merchant_id
    found = @repository.find_by_merchant_id('78')
    assert_equal '3', found.id    
  end

  def test_invioce_repository_find_all_by_staus
    found = @repository.find_all_by_status('shipped')
    assert_equal 47, found.count
  end

  def test_invoice_repository_find_all_by_date
    date = Date.parse('2012-03-27')
    assert_equal 3, @repository.find_all_by_date(date).count
  end

end
