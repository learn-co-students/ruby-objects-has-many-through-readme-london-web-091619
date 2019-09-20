class Waiter
  attr_reader :name, :years_of_experience

  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def initialize(name, years_of_experience)
    @name = name
    @years_of_experience = years_of_experience
    save
  end

  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select { |meal| meal.waiter.eql?(self) }
  end

  def best_tipper
    meals.reduce { |memo, meal| meal.tip > memo.tip ? meal : memo }.customer
  end
end
