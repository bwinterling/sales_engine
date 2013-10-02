require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/sales_engine'

class InvoiceRepositoryTest < Minitest::Test

  def setup
    @sales_engine = SalesEngine.new('test/fixture/')
    @repository = @sales_engine.invoice_repository
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
    found = @repository.find_by_id('7')
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

  def test_create
    input_hash = {
      customer: @sales_engine.customer_repository.find_by_id('1'),
      merchant: @sales_engine.merchant_repository.find_by_id('1'),
      status: "shipped",
      items: [
        @sales_engine.item_repository.find_by_id('2'),
        @sales_engine.item_repository.find_by_id('2'),
        @sales_engine.item_repository.find_by_id('3')
      ]
    }
    start_all_count = @repository.all.count
    start_ii_count = @sales_engine.invoice_item_repository.all.count
    @repository.create(input_hash)
    finish_all_count = @repository.all.count
    finish_ii_count = @sales_engine.invoice_item_repository.all.count
    assert finish_all_count > start_all_count
    assert finish_ii_count == (start_ii_count + 2)
  end

end
