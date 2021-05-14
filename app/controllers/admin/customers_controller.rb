class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

	def update
	@customer = Customer.find(params[:id])
		if @customer.update(customer_params)
		   flash[:success] = "会員情報を変更しました"
		   redirect_to admin_customer_path
		else
			render "edit"
		end
	end

  # Strong parameters
	private
	def customer_params
	  params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_active)
	end
end
