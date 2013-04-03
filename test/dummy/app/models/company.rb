class Company < ActiveRecord::Base
  has_phone_number :customer_support_phone, :phone
  attr_accessible :customer_support_phone, :name, :phone
end
