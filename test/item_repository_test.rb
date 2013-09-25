require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/item_repository'

class ItemRepositoryTest < Minitest::Test

  def setup
    @repository = ItemRepository.new
  end

  def test_item_repository_csv_loaded
    refute_nil @repository.items_csv
    assert_equal 2483, @repository.items_csv.count
  end

  def test_item_repository_all
    refute_nil @repository.items_csv
    assert_equal 2483, @repository.items_csv.count
  end

  def test_item_repository_random
    random1 = @repository.random
    random2 = @repository.random
    refute_equal random1, random2
  end

  def test_item_repository_find_by_name
    found = @repository.find_by_item_id('4')
    assert_equal 'Item Nemo Facere', found.name
  end

  def test_item_repository_find_by_merchant_id
    found = @repository.find_by_merchant_id('2')
    assert_equal '16', found.id 
  end

  def test_item_repository_find_all_by_name
    found = @repository.find_all_by_name('Item Qui Esse')
    assert_equal 'Item Qui Esse', found[0].name
    assert_equal 1, found.count
  end

end
