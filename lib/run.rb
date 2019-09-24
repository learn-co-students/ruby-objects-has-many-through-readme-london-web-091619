require 'pry'
require_relative 'customer.rb'
require_relative 'meal.rb'
require_relative 'waiter.rb'

russ = Customer.new("Russel", 20)
alex = Customer.new("Alex", 30)
rachel = Customer.new("Rachel", 27)

rob = Waiter.new("Robert", 2)
bog = Waiter.new("Bogo", 4)
dan = Waiter.new("Dan", 3)

russ.new_meal(bog, 20, 1)
russ.new_meal(rob, 40, 5)
rachel.new_meal(dan, 50, 10)
alex.new_meal(dan, 30, 5)

# binding.pry
0