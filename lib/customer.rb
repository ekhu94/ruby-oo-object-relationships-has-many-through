class Customer

    @@all = []

    def self.all
        @@all
    end

    attr_accessor :name, :age

    def initialize(name, age)
        @name = name
        @age = age
        save
    end

    def save
        @@all << self
    end

    def new_meal(waiter, total, tip=0)
        Meal.new(self, waiter, total, tip)
    end

    def meals
        Meal.all.select { |meal| meal.customer == self }
    end

    def waiters
        meals = self.meals
        meals.map { |meal| meal.waiter }
    end
end