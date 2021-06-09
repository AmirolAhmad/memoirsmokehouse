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
      "<span class='badge rounded-pill bg-success'><i class=\"fas fa-dollar-sign\"></i></span>".html_safe
    else
      "<span class='badge rounded-pill bg-danger'><i class=\"fas fa-dollar-sign\"></i></span>".html_safe
    end
  end

  def check_promo_status(obj)
    case obj.status
    when "active"
      "<span class='badge rounded-pill bg-success'>Active</span>".html_safe
    when "inactive"
      "<span class='badge rounded-pill bg-warning'>Inactive</span>".html_safe
    else
      "<span class='badge rounded-pill bg-danger'>Expired</span>".html_safe
    end
  end

  def check_delivery_date_status(obj)
    case obj.status
    when "active"
      "<span class='badge rounded-pill bg-success'>Active</span>".html_safe
    else
      "<span class='badge rounded-pill bg-danger'>In Active</span>".html_safe
    end
  end
end
