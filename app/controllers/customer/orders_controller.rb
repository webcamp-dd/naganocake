class Customer::OrdersController < ApplicationController
  before_action :authenticate_customer!
 

  def new
    @order = Order.new
    @add_delivery = Delivery.new #データ保存というよりエラー防止のため追加
  end

  def order_confimation 
    @order = Order.new(order_params)
    unless params[:order][:payment] 
      redirect_back(fallback_location: root_path)
      flash[:notice] = '※支払い方法が選択されていません' and return
    else
      @order.payment = params[:order][:payment]
    end
   
    @order.postage = 800
    @order.customer_id = current_customer.id
    
    @cart_products = current_customer.cart_products
    if params[:order][:delivery_address] == "a"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.family_name + current_customer.first_name
  
    elsif params[:order][:delivery_address] == "b"
      @order.postal_code = Delivery.find(params[:order][:key]).postal_code
      @order.address = Delivery.find(params[:order][:key]).address
      @order.name = Delivery.find(params[:order][:key]).name
    
    elsif params[:order][:delivery_address] == "c"
      #宛先を新規追加後に取得したparamsをorderテーブルに格納する順番に変更することでバリデーションエラー表示
      @add_delivery = Delivery.new
      @add_delivery.customer_id = current_customer.id
      @add_delivery.postal_code = params[:order][:postal_code]
      @add_delivery.address = params[:order][:address]
      @add_delivery.name = params[:order][:name]
      unless @add_delivery.save
        render "new" and return #処理がそこで終了する
      end
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    else
      flash[:notice] = '※支払い方法と配送先を選択してください'
      redirect_back(fallback_location: root_path) and return
      
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
    @cart_products.each do |cart_product|
    cart_product.destroy
    end
  	redirect_to customer_order_thanks_path
  end

  def index
    @customer = current_customer
    @orders = Order.where(customer_id: @customer.id)

  end

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
    # @order_products = OrderProduct.where(product_id: params:[:id]) #書き方がわからない→質問２
      # 注文ステータス確認用
      if @order.status == "入金確認"
        @status = "入金確認"
      elsif @order.status == "製作中"
        @status = "製作中"
      elsif @order.status == "発送準備中"
        @status = "発送準備中"
      elsif @order.status == "発送済み"
        @status = "発送済み"
      else
        @order.status == "入金待ち"
        @status = "入金待ち"
      end
      #支払い方法
      if @order.payment == "クレジットカード"
        @payment = "クレジットカード"
      else
        @payment = "銀行振込"
      end


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

