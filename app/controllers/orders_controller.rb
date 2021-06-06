class OrdersController < ApplicationController
  def new
    @order ||= Order.new
    render
  end

  def create
    @order = Order.new order_params
    if @order.promocode.present?
      @promo = Promocode.find_by_code(@order.promocode)
      if @promo && @promo.count < @promo.limit && Time.now.strftime('%a, %d %b %Y %H:%M:%S') < @promo.expired_at.strftime('%a, %d %b %Y %H:%M:%S')
        if @order.save
          redirect_to order_path(@order)
        else
          render 'new'
        end
      else
        flash.now[:error] = "Promocode is not valid"
        render 'new'
      end
    else
      if @order.save
        redirect_to order_path(@order)
      else
        render 'new'
      end
    end
  end

  def show
    @order = Order.find params[:id]
    @promo = Promocode.find_by_code(@order.promocode)
  end

  def search
    @order = Order.find_by_orderid params[:search]
    if @order
      render
    else
      redirect_to root_path, notice: "Order ID not found"
    end
  end

  private

  def order_params
    params.require(:order).permit(:fullname, :phone_number, :address1, :address2, :city, :postcode, :state_id, :status, :total_price, :delivery_method, :delivery_surcharge, :promocode, :note, menu_ids:[])#, order_menus_attributes: [:_destroy, :id, :order_id, :menu_id, :total_price])
  end
end
