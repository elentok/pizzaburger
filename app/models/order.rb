class Order < ActiveRecord::Base
  belongs_to :client
  attr_accessible :amount, :toppings
end
