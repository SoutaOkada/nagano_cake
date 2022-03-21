class Order < ApplicationRecord
  has_many :order_detail
  has_many :customer
end
