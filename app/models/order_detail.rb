class OrderDetail < ApplicationRecord
  has_many :order
  belongs_to :item

end
