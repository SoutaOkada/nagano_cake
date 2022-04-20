class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @cart_items = current_customer.cart_items

    @order = Order.new(order_params)
    @order.postage = 800
    @total = 0
      @cart_items.each do |total|
        @total += total.subtotal
      end
    @order.payment = @total + @order.postage

      if params[:order][:select_address] == "0"
        @order.shipping_postal_code = current_customer.postal_code
        @order.shipping_address = current_customer.address
        @order.shipping_name = current_customer.last_name + current_customer.first_name
      elsif params[:order][:select_address] == "1"
        @order.shipping_postal_code = Address.find(params[:order][:address_id]).postal_code
        @order.shipping_address = Address.find(params[:order][:address_id]).address
        @order.shipping_name = Address.find(params[:order][:address_id]).name
      end

      @order_details = OrderDetail.new
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.status = 0
    @order.save
      current_customer.cart_items.each do |cart_item|
        @order_detail = OrderDetail.new
        @order_detail.price = cart_item.item.price
        @order_detail.amount = cart_item.amount
        @order_detail.status = 0
        @order_detail.order_id = @order.id
        @order_detail.item_id = cart_item.item_id
        @order_detail.save
      end
    current_customer.cart_items.destroy_all
    redirect_to orders_complete_path
  end

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:shipping_postal_code, :shipping_address,\
      :shipping_name, :postage, :payment, :payment_method)
  end

  def order_details_params
    params.require(:order_detail).permit(:price, :amount)
  end
end
