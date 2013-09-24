require 'csv'
require 'bigdecimal'

class SalesEngine

  def startup
  end

  def merchant_repository
  end

  def invoice_repository
  end

  def item_repository
  end

  def invoice_item_repository
  end

  def customer_repository
  end

#end of SalesEngine class
end


engine = SalesEngine.new
engine.startup
