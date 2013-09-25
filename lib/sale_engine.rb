require 'csv'
require 'bigdecimal'

class SalesEngine

  def startup
    puts "\n\n============================================\n\n REV IT UP !!!!!!!\n\n Here Comes the Sales Engine!!!!\n\n============================================\n\n\n\nPut the pedal to the metal, but if you\nfind yourself unsure, just type help.\n\n"
    input = ""
    while input != "q"
      puts ""
      printf "Vrooooom:"
      input = gets.downcase.chomp
      process_command(input)
    end  
  end

  def process_command(input)
    parts = input.split(" ")
    command = parts[0] 
    case command
      when "help"       then puts "Picked a bad week to quit sniffin' glue?"
      when "q"          then puts "\n\nGoodbye!"
    else
      puts "\nSorry, I don't know to #{command}.\nYou can #{command} on your own time."
    end
  #end of process command
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
