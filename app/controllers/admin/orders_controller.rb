class Admin::OrdersController < AdminController
  def index
    @orders = Order.order('created_at ASC')
  end

  def show
    @order = Order.find params[:id]
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