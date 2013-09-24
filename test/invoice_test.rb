gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice'


class InvoiceTest < Minitest::Test

  def test_invoice_loaded
    invoice = Invoice.new("1")
    assert_equal "1", invoice.customer_id

    invoice = Invoice.new("3")
    assert_equal "78", invoice.merchant_id


  end


end


