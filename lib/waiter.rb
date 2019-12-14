class Waiter
  attr_accessor :name, :yrs_experience
  @@all = []
  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select do |meal|
      meal.waiter == self
    end
  end

  def best_tipper
    self.meals.inject(0){|memo, meal| meal.tip = memo if memo < meal.tip}
  end
end
