require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/invoice_repository'

class InvoiceRepositoryTest < Minitest::Test

  def setup
    @repository = InvoiceRepository.new
  end

  def test_invoice_repository_csv_loaded
    refute_nil @repository.invoice_csv
    assert_equal 4843, @repository.invoice_csv.count
  end

  def test_invoice_repository_all
    refute_nil @repository.invoice
    assert_equal 4843, @repository.invoice.count
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
    assert_equal 4843, found.count
  end

end
