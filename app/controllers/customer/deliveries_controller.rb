class Customer::DeliveriesController < ApplicationController
  #before_action :authenticate_customer!
  
  def index
    @customer = current_customer
    @deliveries = @customer.deliveries
    # @deliveries = Deliverie.where(customer_id: @customer.id)
    @delivery = Delivery.new
  end

  def create
    @delivery = Delivery.new(delivery_params) 
    @delivery.customer_id = current_customer.id
    if @delivery.save
  		redirect_to customer_deliveries_path, notice: "配送先を保存しました"
  	# else
  	# 	@deliveries = Delivery.all
  	# 	redirect_to customer_deliveries_path
  	end
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end
  

  def show
    @delivery = Delivery.find(params[:id])
  end

  def update
    @delivery = Delivery.find(params[:id])
  	if @delivery.update(delivery_params)
  		redirect_to customer_deliveries_path, notice: "配送先情報を更新しました"
  	else
  		redirect_to :edit
  	end
  end

  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
  	redirect_to customer_deliveries_path, notice: "配送先を削除しました"
  end
end


private

def delivery_params
  params.require(:delivery).permit(:email, :postal_code, :address ,:name, :customer_id)
end