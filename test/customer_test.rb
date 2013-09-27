require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/customer'

class CustomerTest < Minitest::Test

  def customer
    @customer ||= SalesEngine.new.customer_repository.find_by_customer_id('1')
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

  def test_customer_has_no_created_at
    refute_nil customer.created_at
  end

end
