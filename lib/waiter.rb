class Waiter
    @@all = []
    attr_reader :name, :experience
    def initialize(name, experience)
        @name = name
        @experience = experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
            Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
        best_tip = 0
        best_customer = nil

        meals.each { |meal| 
        if meal.tip > best_tip
            best_tip = meal.tip
            best_customer = meal.customer
        end
    }
    best_customer
    end
end