class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :order_details

  has_one_attached :image

  def add_tax_price
    (self.price * 1.1).floor
  end
end
