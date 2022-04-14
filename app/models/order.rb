class Order < ApplicationRecord
  belongs_to :order_detail
  belongs_to :customer

  enum payment_method: {credit_card: 0, transfer: 1}
  enum status: {waiting_pay: 0, payed: 1, progress: 2, standby: 3, complete: 4}
end
