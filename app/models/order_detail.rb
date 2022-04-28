class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum status: {cannot_start: 0, waiting: 1, progress: 2, complete: 3}
end
