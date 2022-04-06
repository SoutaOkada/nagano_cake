class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.where(@address.customer_id == current_customer.id)
  end

  def edit
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to request.referer
  end

  def update
  end

  def destroy
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
