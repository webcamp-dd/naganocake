class Customer::CustomersController < ApplicationController

  def leave
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def update
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def delete_confimation
  end

  def update
	  @customer = Customer.find(params[:id])
	  if @customer.update(customer_params)
		  redirect_to customer_path(@customer)
	  else
		  render 'edit'
	  end
	end

  private
	  	def customer_params
		 	  params.require(:customer).permit(:name, :family_name, :first_name, :kana_family_name, :kana_first_name, :postal_code, :address, :phone_number, :is_valid)
      end
  end
  

end
