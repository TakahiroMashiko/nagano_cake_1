module ApplicationHelper

  # Customer's full name
  def full_name(customer)
    customer.last_name + customer.first_name
  end

end
