require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class SalesEngineTest < Minitest::Test

  def startup
    @engine = SalesEngine.new
    @engine.startup
  end

  def test_instance_exists
    refute_nil @engine
  end

end
