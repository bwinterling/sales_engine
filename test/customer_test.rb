require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/customer'

class CustomerTest < Minitest::Test

  def sample_data
    {
      id: "1",
      first_name: "Joey",
      last_name: "Ondricka",
      created_at: Time.new,
      updated_at: Time.new
    }
  end

  def customer
    @customer ||= Customer.new(sample_data)
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
