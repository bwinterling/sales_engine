require 'csv'
require_relative 'customer'

class CustomerRepository

  def initialize(sales_engine)
    @sales_engine = sales_engine
  end

  def data
    CSV.read(data_file, headers: true, header_converters: :symbol)
  end

  def data_file
    "#{@sales_engine.dir}customers.csv"
  end

  def customers
    all
  end

  def all
    @all ||= data.collect { |row| Customer.new(self, row) }
  end

  def random
    all.sample
  end  

  def find_by_customer_id(match)
    all.find { |customer| customer.id == match }
  end

  def find_by_first_name(match)
    all.find { |customer| customer.first_name == match }
  end

  def find_by_last_name(match)
    all.find { |customer| customer.last_name == match }
  end

  def find_all_by_first_name(match)
    all.find_all { |customer| customer.first_name == match }
  end

  def find_all_by_last_name(match)
    all.find_all { |customer| customer.last_name == match }    
  end

  def find_invoices_by(customer_id)
    @sales_engine.invoice_repository.find_all_by_customer_id(customer_id)
  end

end
