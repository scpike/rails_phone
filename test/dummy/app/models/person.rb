class Person < ActiveRecord::Base
  has_phone_number
  attr_accessible :name, :phone
end
