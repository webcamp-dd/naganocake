class Customer::CustomersController < ApplicationController
  def leave
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def update
  end

  def edit
  end

  def delete_confimation
  end

  private
	  	def customer_params
		 	params.require(:customer).permit(:name, :family_name, :first_name, :kana_family_name, :kana_first_name, :postal_code, :address, :phone_number, :valid)
	end

end
