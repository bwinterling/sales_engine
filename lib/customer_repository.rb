require 'csv'
require_relative 'customer'

class CustomerRepository

  attr_reader :customer_csv, :customers

  def initialize
    @customer_csv ||= load_customer_csv
    @customers ||= all
  end

  def load_customer_csv
    CSV.read('data/customers.csv', headers: true, header_converters: :symbol)
  end

  def all
    @customers = @customer_csv.collect do |row|
      Customer.new(row)
    end
  end

  def random
    random_id = ""
    total_rows = @customers.count
    random_id = rand(total_rows).to_s
    random_customer = @customers.find { |customer| customer.id == random_id }
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

end
