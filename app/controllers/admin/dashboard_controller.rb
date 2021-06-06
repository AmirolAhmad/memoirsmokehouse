class Admin::DashboardController < AdminController
  def index
    date_beginning_this_week = Time.zone.now.beginning_of_week
    @total_orders_this_week = Order.where(created_at: date_beginning_this_week..Time.zone.now)
    @paid_orders = Order.where('paid= ?', true)
    @unpaid_orders = Order.where('paid= ?', false)
    @today_orders = Order.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    @pending_orders = Order.where('status != ?', 3).where('paid= ?', true)
    @total_weekly_paid_orders = Order.where(created_at: date_beginning_this_week..Time.zone.now).where('paid= ?', true).sum(:total_price)
    @total_monthly_paid_orders = Order.where(created_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month).where('paid= ?', true).sum(:total_price)
    @total_orders_this_month = Order.where(created_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month)
  end
end
