require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/sales_engine'

class CustomerTest < Minitest::Test

  def customer
    @customer ||= SalesEngine.new('test/fixture/').customer_repository.find_by_customer_id('1')
  end

  def test_customer_has_a_last_name
    assert_equal "Ondricka", customer.last_name
  end

  def test_customer_has_a_first_name
    assert_equal "Joey", customer.first_name
  end

  def test_customer_has_an_id
    assert_equal "1", customer.id
  end

  def test_successful_invoices

    assert_equal 7, customer.successful_invoices.count
  end

  def test_pending_invoices
    assert_equal 1, customer.pending_invoices.count
  end

  def test_has_pending_invoices
    assert customer.has_pending_invoices?
  end

  def test_customer_has_no_created_at
    refute_nil customer.created_at
  end

end
