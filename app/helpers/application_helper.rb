module ApplicationHelper

  # Customer's full name
  def full_name(customer)
    customer.last_name + customer.first_name
  end

  # Customer's full name kana
	def full_name_kana(customer)
		customer.last_name_kana + customer.first_name_kana
	end

	# Customer's full address
	def full_address(key)
	  "#{key.shipping_postal_code} #{key.shipping_address} #{key.shipping_name}"
	end

  # Tax-included calculation
  def tax_price(price)
    (price * 1.1).floor
  end
end
