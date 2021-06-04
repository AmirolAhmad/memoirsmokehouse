class OrdersController < ApplicationController
  def new
    @order ||= Order.new
    render
  end

  def create
    @order = Order.new order_params
    if @order.save
      redirect_to order_path
    else
      render 'new'
    end
  end

  def show
    @order = Order.find params[:id]
  end

  private

  def order_params
    params.require(:order).permit(:fullname, :phone_number, :address1, :address2, :city, :postcode, :state, :status, :total_price, :delivery_method)
  end
end
