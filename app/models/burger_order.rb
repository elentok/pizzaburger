class BurgerOrder < Order
  attr_accessible :how_done, :fries
  validates_presence_of :how_done, :fries

  def details
    with_fries = fries ? "with" : "without"
    "#{how_done} #{with_fries} fries"
  end
end
