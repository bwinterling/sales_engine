require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/customer'

class CustomerTest < Minitest::Test

  def test_customer_loaded
    row = {
      id: "1",
      first_name: "Joey",
      last_name: "Ondricka",
      created_at: Time.new,
      updated_at: Time.new
      }

    customer = Customer.new(row)
    assert_equal "Ondricka", customer.last_name
    assert_equal "Joey", customer.first_name
    assert_equal "1", customer.id
    refute_nil customer.created_at
  end

end
