class Admin::HomesController < ApplicationController
  def top
    @order = Order.where(created_at: Time.current.beginning_of_day..Time.current.end_of_day)
  end
  # Time→Dateでもできる
end
