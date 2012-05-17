class Client < ActiveRecord::Base
  attr_accessible :address, :name, :phone
  has_many :orders
  validates_presence_of :address, :name, :phone
end
