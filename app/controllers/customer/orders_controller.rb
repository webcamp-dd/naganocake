class Customer::OrdersController < ApplicationController
  def index
  end

  def new
  @order = Order.new    
  end

  def order_confimation
  end
  

  def create
    byebug
  end

  def show
  end

  def thanks
  end
end
