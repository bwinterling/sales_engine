require 'csv'
require 'bigdecimal'

require_relative 'merchant_repository'
require_relative 'item_repository'
require_relative 'invoice_repository'
require_relative 'invoice_item_repository'
require_relative 'transaction_repository'
require_relative 'customer_repository'

class SalesEngine

  def startup
  end

  def merchant_repository
    @merchant_repository ||= MerchantRepository.new(self)
  end

  def invoice_repository
    @invoice_repository ||= InvoiceRepository.new(self)
  end

  def item_repository
    @item_repository ||= ItemRepository.new(self)
  end

  def invoice_item_repository
    @invoice_item_repository ||= InvoiceItemRepository.new(self)
  end

  def customer_repository
    @customer_repository ||= CustomerRepository.new(self)
  end

  def transaction_repository
    @transaction_respository ||= TransactionRepository.new(self)
  end

end


engine = SalesEngine.new
engine.startup
