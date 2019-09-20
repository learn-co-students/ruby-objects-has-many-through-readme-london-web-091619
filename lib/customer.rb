class Customer

    attr_accessor :name, :age #each customer is different, so current customer will change after eating
    #meaning name and age must be changeable 

    @@all = [] #class variable

    def initialize(name, age) #initializing name and age, creating instance variables that can be used throughout
        @name = name
        @age = age #instance variables 
        @@all << self # pushes current customer in array
    end

    def self.all#defines current customer 
        @@all
    end

    def meals
        Meal.all.select do |meal|
          meal.customer == self
        end
    end

    def waiters
        meals.map do |meal|
          meal.waiter
        end
    end

    def new_meal(waiter, total, tip=0)
        Meal.new(waiter, self, total, tip)
      end
     
      def new_meal_20_percent(waiter, total)
        tip = total * 0.2
        Meal.new(waiter, self, total, tip)
      end
     
      def self.oldest_customer
        oldest_age = 0
        oldest_customer = nil
        self.all.each do |customer|
          if customer.age > oldest_age
            oldest_age = customer.age
            oldest_customer = customer
          end
        end
        oldest_customer
      end


  
end