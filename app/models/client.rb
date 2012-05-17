class Client < ActiveRecord::Base
  attr_accessible :address, :name, :phone
  has_many :orders
end
