class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)

    if @order_detail.status == "progress"
      @order_detail.order.update(status: 2)
    end

    @order = @order_detail.order
    @order_details = @order.order_details.all

    @number = 0
    @order_details.each do |order_detail|
      if order_detail.status == "complete"
        @number = @number + 1
      end
    end
    if @number == @order_details.count
      @order.update(status: "standby")
    end
    redirect_to request.referer
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:status)
  end
end
