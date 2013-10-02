require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'bigdecimal'

require_relative '../lib/sales_engine'

class InvoiceItemRepositoryTest < Minitest::Test

  def setup
    @repository = SalesEngine.new('test/fixture/').invoice_item_repository
  end

  def test_invoice_item_repository_all
    refute_nil @repository.invoice_items
    assert_equal 206, @repository.invoice_items.count
  end

  def test_invoice_item_repository_random
    random1 = @repository.random
    random2 = @repository.random
    refute_equal random1, random2
  end

  def test_find_by_invoice_item_id
    found = @repository.find_by_id('5')
    assert_equal '529', found.item_id 
  end

  def test_find_by_item_id
    found = @repository.find_by_item_id('848')
    assert_equal '38', found.id 
  end

  def test_find_all_by_item_id
    found = @repository.find_all_by_item_id('523')
    assert_equal 1, found.count
  end

  def test_find_by_invoice_id
    found = @repository.find_by_invoice_id('13')
    assert_equal '62', found.id 
  end

  def test_find_all_by_invoice_id
    found = @repository.find_all_by_invoice_id('22')
    assert_equal 7, found.count
  end

  def test_find_by_quantity
    found = @repository.find_by_quantity('4')
    assert_equal '530', found.item_id
  end

  def test_find_all_by_quantity
    found = @repository.find_all_by_quantity('3')
    assert_equal 19, found.count
  end


  def test_find_by_unit_price
    price = BigDecimal('79140')
    found = @repository.find_by_unit_price(price)
    assert_equal '529', found.item_id
  end

  def test_find_all_by_unit_price
    price = BigDecimal('72018')
    found = @repository.find_all_by_unit_price(price)
    assert_equal 3, found.count
  end

end
