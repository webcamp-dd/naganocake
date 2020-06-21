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
  end
end
