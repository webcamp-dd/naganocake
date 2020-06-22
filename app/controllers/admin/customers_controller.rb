class Admin::CustomersController < ApplicationController
  def index
    #@customers = Customer.page(params[:page])
    @customers = Customer.with_deleted.page(params[:page])
  end

  def show
  	@customer = Customer.find(params[:id])
  end

  def edit
  	@customer = Customer.find(params[:id])
  end

  def update
  end
end
