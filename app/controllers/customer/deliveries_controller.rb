class Customer::DeliveriesController < ApplicationController
  #before_action :authenticate_customer!

  def index
    @customer = current_customer
    @deliveries = @customer.deliveries
    @deliverie = Deliverie.new
  end

  def create
    @deliverie = Deliverie.new(deliverie_params) 
    if @deliverie.save 
  		redirect_to customer_deliveries_index_path, notice: "配送先を保存しました"
  	else
  		@deliveries = Deliverie.all
  		redirect_to :index
  	end
  end

  def edit
    @deliverie = Deliverie.find(params[:id])
  end
  

  def show
    @deliveries = Deliverie.find(params[:id])
  end

  def update
    @deliverie = Deliverie.find(params[:id])
  	if @deliverie.update(deliverie_params)
  		redirect_to customer_deliveries_path, notice: "配送先情報を更新しました"
  	else
  		redirect_to :edit
  	end
  end

  def destroy
    @deliverie = Deliverie.find(params[:id])
    @deliverie.destroy
  	redirect_to customer_deliveries_path, notice: "配送先を削除しました"
  end
end


private

def deliverie_params
  params.permit(:postal_code, :address ,:name, :id)
end