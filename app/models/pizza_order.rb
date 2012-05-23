class PizzaOrder < Order
  attr_accessible :amount, :toppings
  def details
    "#{amount} pizzas with #{toppings}"
  end
end
