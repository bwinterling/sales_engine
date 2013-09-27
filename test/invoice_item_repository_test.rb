require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/invoice_item_repository'

class InvoiceItemRepositoryTest < Minitest::Test

  def setup
    @repository = SalesEngine.new.invoice_item_repository
  end

  def test_invoice_item_repository_csv_loaded
    refute_nil @repository.invoice_items_csv
    assert_equal 21687, @repository.invoice_items_csv.count
  end

  def test_invoice_item_repository_all
    refute_nil @repository.invoice_items
    assert_equal 21687, @repository.invoice_items.count
  end

  def test_invoice_item_repository_random
    random1 = @repository.random
    random2 = @repository.random
    refute_equal random1, random2
  end

  def test_find_by_invoice_item_id
    found = @repository.find_by_invoice_item_id('5')
    assert_equal '529', found.item_id 
  end

  def test_find_by_item_id
    found = @repository.find_by_item_id('5')
    assert_equal '719', found.id 
  end

  def test_find_all_by_item_id
    found = @repository.find_all_by_item_id('12')
    assert_equal 13, found.count
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
    assert_equal 2166, found.count
  end


  def test_find_by_unit_price
    found = @repository.find_by_unit_price('79140')
    assert_equal '529', found.item_id
  end

  def test_find_all_by_unit_price
    found = @repository.find_all_by_unit_price('72018')
    assert_equal 33, found.count
  end

end
