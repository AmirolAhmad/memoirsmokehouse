class Admin::OrdersController < AdminController
  def index
    @uncomplete_orders = Order.order('created_at ASC').where('status != ?', 3).where('status != ?', 4)
    @unpaid_orders = Order.order('created_at ASC').where('paid= ?', false) - @uncomplete_orders
    @pending_orders = @uncomplete_orders + @unpaid_orders
    @completed_orders = Order.order('created_at ASC').where('paid= ?', true).where('status= ?', 3)
  end

  def show
    @order = Order.find params[:id]
    @promo = Promocode.find_by_code(@order.promocode)
  end

  def destroy
    @order = Order.find params[:id]
    if @order.destroy
      redirect_to admin_orders_path, notice: 'Order Deleted!'
    else
      render 'index'
    end
  end

  def mark_preparing
    @order = Order.find params[:id]
    if @order.update_attribute(:status, 1)
      redirect_to admin_orders_path
    else
      render 'index'
    end
  end

  def mark_delivering
    @order = Order.find params[:id]
    if @order.update_attribute(:status, 2)
      redirect_to admin_orders_path
    else
      render 'index'
    end
  end

  def mark_delivered
    @order = Order.find params[:id]
    if @order.update_attribute(:status, 3)
      redirect_to admin_orders_path
    else
      render 'index'
    end
  end

  def mark_cancelled
    @order = Order.find params[:id]
    if @order.update_attribute(:status, 4)
      redirect_to admin_orders_path
    else
      render 'index'
    end
  end

  def mark_paid
    @order = Order.find params[:id]
    if @order.update_attribute(:paid, true)
      redirect_to admin_orders_path
    else
      render 'index'
    end
  end

  def mark_unpaid
    @order = Order.find params[:id]
    if @order.update_attribute(:paid, false)
      redirect_to admin_orders_path
    else
      render 'index'
    end
  end
end