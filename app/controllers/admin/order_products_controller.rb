class Admin::OrderProductsController < ApplicationController
  before_action :authenticate_admin!
  def update
    @order_item = OrderProduct.find(params[:id])
    @order_id = @order_item.order_id
    @order = Order.find(@order_id)

    @order_item.update(status: params[:order_product][:status]) #ひだりが更新先のカラム、右が入れたい値
    @order_product = @order.order_products
     # 注文ステータスの自動更新その１。紐づく注文商品の制作が一つでも製作中になったら自動更新。
     @order_product.each do |order_p|
      if order_p.status == "製作中"
          @order.status = "in_production" #注文ステータスを製作中に変更
          @order.save
        # 注文ステータスの自動更新その2。紐づく注文商品の制作ステータスが全て制作完了になったら自動更新
      end
      if order_p.status != "製作完了"
        @status_flag = "製作完了以外"
        order_p.save
      end
    end
    if @status_flag != "製作完了以外"
        @order.status = "in_production"  #注文ステータスを発送準備中に変更
        @order.save
      end
    end
  end