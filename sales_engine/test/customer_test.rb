require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/customer'

class CustomerTest < Minitest::Test

  def test_customer_loaded
    customer = Customer.new('1')
    assert_equal 'Ondricka', customer.last_name
    customer3 = Customer.new('3')
    assert_equal '2012-03-27 14:54:10 UTC', customer3.created
  end

end
