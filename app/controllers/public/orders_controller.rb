class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_confirm_path
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:shipping_postal_code, :shipping_address,\
      :shipping_name, :payment_method)
  end
end
