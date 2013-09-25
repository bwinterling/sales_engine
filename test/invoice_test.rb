gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice'


class InvoiceTest < Minitest::Test

  def sample_data
    {
      id: "1",
      customer_id: "1",
      merchant_id: "26",
      status: "shipped",
      created_at: Time.new,
      updated_at: Time.new
    }
  end

  def invoice
    @invoice ||= Invoice.new(sample_data)
  end

  def test_invoice_has_an_id
    assert_equal "1", invoice.id
  end

  def test_invoice_has_a_customer_id
    assert_equal "1", invoice.customer_id
  end

  def test_invoice_has_a_merchant_id
    assert_equal "26", invoice.merchant_id
  end

  def test_invoice_has_a_status
    assert_equal "shipped", invoice.status
  end

  def test_invoice_has_a_created_at
    refute_nil invoice.created_at
  end

end
