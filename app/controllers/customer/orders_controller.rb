class Customer::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @customer = current_customer
    @orders = Order.where(customer_id: @customer.id)
    @orderproducts = Order.order_products
  end

  def order_confimation 
    byebug
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.payment = params[:payment]
    @cart_products = current_customer.cart_products
    if params[:address] = 1
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.family_name + current_customer.first_name
  
    elsif params[:address] = 2
      @order.postal_code = Delivery.find(params[:order][:key])
      @order.address = Delivery.find(params[:order][:key])
      @order.name = Delivery.find(params[:order][:key])

    else params[:address] = 3
      @order.postal_code = params[:postal_code]
      @order.address = params[:address]
      @order.name = params[:name]
    end
  end

  def create 
    @cart_products = current_customer.cart_products
    sum_price = 0
    @cart_products.each do |cart_product|
      Order_product.new
      OrderProduct.quantity = cart_product.quantity.to_i
      OrderProduct.purchase_unit_price = cart_product.product.unit_price
      sumone = OrderProduct.quantity.to_i * OrderProduct.purchase_unit_price.to_i
      sum_price += sumone
    end
    @confirm_order = Order.new(order_params)
    Order.postage = 800
    Oeder.total_price = sum_price
    Order.payment =  params[:payment]
    Order.postal_code = @order.postal_code
    Order.address = @order.address
    Order.name = @order.name
    @confirm_order.save
  	redirect_to customer_order_thanks_path
  end

  def show
    @order = Order.find(params[:id])
    @orderproducts = Order.order_products
    @orderproducts = @order.order_products
    # @order_products = OrderProduct.where(product_id: params:[:id]) #書き方がわからない→質問２
  end

  def thanks
  end


  private
  def order_params
   params.permit(:customer_id, 
                                  :postage, 
                                  :total_price, 
                                  :payment, 
                                  :postal_code, 
                                  :address, 
                                  :name)
  end

end

