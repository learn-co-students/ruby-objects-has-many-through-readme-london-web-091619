class Customer
  attr_accessor :name, :age

  @@all = []

  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(waiter, total, tip = 0)
    Meal.new(waiter, self, total, tip)
  end

  def new_meal_20_percent(waiter, total)
    tip = total * 20
    Meal.new(waiter, self, total, tip)
  end

  # allows a customer to see all the meals they've had
  def meals
    Meal.all.select do |meal|
      meal.customer == self
    end
  end

  def visits
    meals.length
  end

  # allows a customer to see all the waiter's they've ever had
  def waiters
    meals.map do |meal|
      meal.waiter
    end
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

  def self.most_frequent_customer
    most_meals = 0
    customer_most_visits = nil
    self.all.each do |customer|
      if customer.visits > most_meals
        most_meals = customer.visits
        customer_most_visits = customer
      end
    end
    customer_most_visits
  end
end
