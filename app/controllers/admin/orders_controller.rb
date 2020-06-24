class Admin::OrdersController < ApplicationController

  def index
  	@orders = Order.page(params[:page])
  end

  def show
  	@order = Order.find(params[:id])
    @order_product = @order.order_products
   
  end

  def new
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_order_path(@order), notice: "更新完了"
    end
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end
end