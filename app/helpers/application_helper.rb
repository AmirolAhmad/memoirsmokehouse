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

  def check_payment(obj)
    case obj.paid
    when true
      "<span class='badge rounded-pill bg-success'>Paid</span>".html_safe
    else
      "<span class='badge rounded-pill bg-danger'>Unpaid</span>".html_safe
    end
  end
end
