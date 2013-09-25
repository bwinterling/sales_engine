require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/transaction'

class ItemTest < Minitest::Test

  def sample_date
    {
      id: "1",
      invoice_id: "4",
      credit_card_number: "26",
      credit_card_expiration_date: "19.99",
      result: "aprooved",
      created_at: Time.new,
      updated_at: Time.new  
      }
  end

  def transaction
    @transaction ||= Transaction.new(sample_date)
  end

  def test_transaction_has_an_id
    assert_equal '1', transaction.id
  end

  def test_transaction_has_a_invoice_id
    assert_equal '4', transaction.invoice_id
  end

  def test_transaction_has_a_credit_card_number
    assert_equal '26', transaction.credit_card_number
  end

  def test_transaction_has_an_cc_expiration
    assert_equal '19.99', transaction.credit_card_expiration_date
  end

  def test_transaction_has_a_result
    assert_equal 'aprooved', transaction.result
  end

  def test_transaction_has_a_created_at
    refute_nil transaction.created_at
  end
    
end
