module ApplicationHelper
  def check_status(obj)
    case obj.status
    when 'received'
      "<span class='badge bg-success'>Order Received</span>".html_safe
    when 'preparing'
      "<span class='badge bg-warning'>Preparing</span>".html_safe
    when 'delivering'
      "<span class='badge bg-info'>Delivering</span>".html_safe
    when 'delivered'
      "<span class='badge bg-primary'>Delivered</span>".html_safe
    else
      "<span class='badge bg-danger'>Cancelled</span>".html_safe
    end
  end
end
