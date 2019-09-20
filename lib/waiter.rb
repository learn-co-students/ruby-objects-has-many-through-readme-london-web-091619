class Waiter

    attr_accessor :name, :yrs_experience #class has a name and an attribute describing their years of experience

    @@all = [] #class variable

    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience
        @@all << self  #has a class variable that stores every waiter instance upon initialization.
    end

    def self.all
        @@all
    end #causes return of all array

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal|
          meal.waiter == self #checking for waiter now
        end
    end

    def best_tipper
        best_tipped_meal = meals.max do |meal_a, meal_b|
          meal_a.tip <=> meal_b.tip
        end
       
        best_tipped_meal.customer
    end

end