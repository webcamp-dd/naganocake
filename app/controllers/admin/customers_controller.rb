class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.with_deleted.page(params[:page])
  end

  def show
  	@customer = Customer.find(params[:id])
  end

  def edit
  	@customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    # byebug
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer.id), notice: "更新完了"
    else
      render "edit"
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:family_name,:first_name,:kana_family_name,:kana_first_name,:postal_code,:address,:phone_number,:email,:is_active)
  end
end
