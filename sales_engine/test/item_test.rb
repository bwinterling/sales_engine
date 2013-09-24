gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/item'


class ItemTest < Minitest::Test

  def test_item_loaded
    item = Item.new("1")
    assert_equal "Item Qui Esse", item.name
    
    item = Item.new("2")
    assert_equal "Item Autem Minima", item.name


  end

end
