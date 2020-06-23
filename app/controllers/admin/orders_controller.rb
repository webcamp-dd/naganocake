class Admin::OrdersController < ApplicationController

  def index
  	@orders = Order.page(params[:page])
  end

  def show
  	@order = Order.find(params[:id])
    @order_product = @order.order_products

    # どこに記載すべき？注文ステータスの自動更新その１。紐づく注文商品の制作が一つでも製作中になったら自動更新。
    if @order.order_products.status == "製作中"
      　　order.status == "in_production"
        　@status = "製作中"
      end
  
      # 注文ステータスの自動更新その2。紐づく注文商品の制作ステータスが全て制作完了になったら自動更新
      if @order.order_product.status == "制作待ち"
        order.status == "preparing_delivery"
        @status = "発送準備中"    
      end


  end

  def new
  end

  def update
  end
end
