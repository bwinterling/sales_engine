require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/transaction'

class ItemTest < Minitest::Test

  def test_transaction_loaded
    row = {
      invoice_id: "4",
      credit_card_number: "26",
      credit_card_expiration_date: "19.99",
      result: "aprooved",
      created_at: Time.new,
      updated_at: Time.new
      }

    transaction = Transaction.new(row)
    assert_equal '19.99', transaction.credit_card_expiration_date
    assert_equal 'aprooved', transaction.result
    assert_equal '26', transaction.credit_card_number
    assert_equal '4', transaction.invoice_id
    refute_nil transaction.created_at
  end
end
