gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice'


class InvoiceTest < Minitest::Test

  def test_invoice_loaded
    row = {
      id: "1",
      customer_id: "1",
      merchant_id: "26",
      status: "shipped",
      created_at: Time.new,
      updated_at: Time.new
      }

    invoice = Invoice.new(row)
    assert_equal 'shipped', invoice.status
    assert_equal '26', invoice.merchant_id
    assert_equal '1', invoice.customer_id
    assert_equal '1', invoice.id
    refute_nil invoice.created_at
  end

end
