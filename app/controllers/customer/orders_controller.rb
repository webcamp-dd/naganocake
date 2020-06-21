class Customer::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @customer = current_customer
    @orders = Order.where(customer_id: @customer.id)
    @orderproducts = Order.order_products
  end

  def new
  @order = Order.new   
  ＠deliveries = current_customer.deliveries
    @deliveries.each do |delivery|
      @deliveries_addresses = delivery.postal_code + delivery.address + delivery.name
    end
  end

  def order_confimation
    @order = Order.find(params[:id]) #あってるか怪しい
    @orderproducts = Order.order_products
    if params[:address] = 1
      ＠postal_code　= current_customer.postal_code
      @address = current_customer.address
      @name = current_customer.name
      @order_address = @postal_code + @address + @name
  
    elsif params[:address] = 2
      @order_address = delivery
  
    else params[:address] = 3
      # ＠postal_code =
      # @address = 
      # @name =

    end
  end

  

  def create  
  end

  def show
    @order = Order.find(params[:id])
    @orderproducts = Order.order_products
    # @order_products = OrderProduct.where(product_id: params:[:id]) #書き方がわからない→質問２
  end

  def thanks
  end

end
