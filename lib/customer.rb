class Customer
  attr_reader :name, :age

  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def initialize(name, age)
    @name = name
    @age = age
    save
  end

  def new_meal(waiter, total, tip)
    Meal.new(waiter, self, total, tip)
  end

  def meals
    Meal.all.select { |meal| meal.customer.eql?(self) }
  end

  def waiters
    meals.map(&:waiter)
  end
end
