class Meal

    @@all = []

    def self.all
        @@all
    end

    attr_accessor :customer, :waiter, :total, :tip

    def initialize(customer, waiter, total, tip=0)
        @customer = customer
        @waiter = waiter
        @total = total
        @tip = tip
        save
    end

    def save
        @@all << self
    end

end