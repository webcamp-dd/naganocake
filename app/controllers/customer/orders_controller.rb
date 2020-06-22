class Customer::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @customer = current_customer
    @orders = Order.where(customer_id: @customer.id)
    # @orderproducts = Order.order_products
  end

  def order_confimation 
    
    @order = Order.new(order_params)
    @order.postage = 800
    @order.customer_id = current_customer.id
    @order.payment = params[:payment]
    @cart_products = current_customer.cart_products
    if params[:delivery_address] == "a"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.family_name + current_customer.first_name
  
    elsif params[:delivery_address] == "b"
      @order.postal_code = Delivery.find(params[:key]).postal_code
      @order.address = Delivery.find(params[:key]).address
      @order.name = Delivery.find(params[:key]).name
    else
      @order.postal_code = params[:postal_code]
      @order.address = params[:address]
      @order.name = params[:name]
    end
  end

  def create 
   
    @cart_products = current_customer.cart_products
   
    @confirm_order = Order.new(order_params)
    @confirm_order.postage = 800
    @confirm_order.total_price = params[:order][:key_product_sum]
    @confirm_order.payment =  params[:order][:key_payment]
    @confirm_order.postal_code = params[:order][:key_postal_code]
    @confirm_order.address = params[:order][:key_address]
    @confirm_order.name = params[:order][:key_name]
    @confirm_order.id =  params[:order][:key_order_id]
    @confirm_order.customer_id = current_customer.id
    byebug
    @confirm_order.save
    
    sum_price = 0
    @cart_products.each do |cart_product|
      @confirm_product = OrderProduct.new
      @confirm_product.quantity = cart_product.quantity.to_i
      @confirm_product.purchase_unit_price = cart_product.product.unit_price
      sumone = @confirm_product.quantity.to_i * @confirm_product.purchase_unit_price.to_i
      sum_price += sumone
      @confirm_product.product_id = cart_product.product_id
      @confirm_product.order_id  = @confirm_order.id
      @confirm_product.save
    end
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

