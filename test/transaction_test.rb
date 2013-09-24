require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/transaction'

class TransactionTest < Minitest::Test

  def test_transaction_loaded
    transaction = Transaction.new('1')
    assert_equal '4654405418249632', transaction.credit_card_number
    transaction3 = Transaction.new('3')
    assert_equal 'success', transaction3.result
  end

# end of TransactionTest class
end
