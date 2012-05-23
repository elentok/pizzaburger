class Order < ActiveRecord::Base
  belongs_to :client
  validates_presence_of :client
  attr_accessible :client_id
end
