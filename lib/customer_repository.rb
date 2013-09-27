require 'csv'
require_relative 'customer'

class CustomerRepository

  attr_reader :customer_csv, :customers

  def initialize(sales_engine)
    @sales_engine = sales_engine
    @customer_csv ||= load_customer_csv
    @customers ||= all
  end

  def load_customer_csv
    CSV.read('data/customers.csv', headers: true, header_converters: :symbol)
  end

  def all
    @customers = @customer_csv.collect do |row|
      Customer.new(self, row)
    end
  end

  def random
    @customers.sample
  end  

  def find_by_customer_id(match)
    @customers.find { |customer| customer.id == match }
  end

  def find_by_first_name(match)
    @customers.find { |customer| customer.first_name == match }
  end

  def find_by_last_name(match)
    @customers.find { |customer| customer.last_name == match }
  end

  def find_all_by_first_name(match)
    @customers.find_all { |customer| customer.first_name == match }
  end

  def find_all_by_last_name(match)
    @customers.find_all { |customer| customer.last_name == match }    
  end

  def find_invoices_by(customer_id)
    @sales_engine.invoice_repository.find_all_by_customer_id(customer_id)
  end

end
