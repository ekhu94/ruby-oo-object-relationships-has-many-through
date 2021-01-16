class Waiter

    @@all = []

    def self.all
        @@all
    end

    attr_accessor :name, :yrs_experience

    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience
        save
    end

    def save
        @@all << self
    end

    def new_meal(customer, total, tip=0)
        Meal.new(customer, self, total, tip)
    end

    def meals
        Meal.all.select { |meal| meal.waiter == self }
    end

    def best_tipper
        meals.max { |a, b| a.tip <=> b.tip }.customer
    end
end