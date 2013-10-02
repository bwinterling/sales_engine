require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/sales_engine'

class ItemTest < Minitest::Test

  def transaction
    @transaction ||= SalesEngine.new('test/fixture/').transaction_repository.find_by_id('8')
  end

  def test_transaction_has_an_id
    assert_equal '8', transaction.id
  end

  def test_transaction_has_a_invoice_id
    assert_equal '9', transaction.invoice_id
  end

  def test_transaction_has_a_credit_card_number
    assert_equal '4540842003561938', transaction.credit_card_number
  end

  def test_transaction_has_a_result
    assert_equal 'success', transaction.result
  end

  def test_transaction_has_a_created_at
    refute_nil transaction.created_at
  end
    
end
