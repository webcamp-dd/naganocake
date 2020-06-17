class Customer::CartProductsController < ApplicationController
  def index
    @cart_products = current_user.cart_items.all
    
  end

  def create
    @cart_product = CartProduct.new
    if @cart_product.save
      redirect_back(fallback_location: root_path) , notice:"カートに商品を追加しました"
    else
      redirect_back(fallback_location: root_path), notice:"カートに商品が追加できませんでした"
    end

  end

  def update
    @cart_product = CartProduct.find(params[:id])
    if @cart_product.update(cart_product_params)
      redirect_back(fallback_location: root_path) , notice:"カート情報を更新しました"
    else
      redirect_back(fallback_location: root_path) , notice:"カート情報が更新できませんでした"
    end

  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    redirect_back(fallback_location: root_path) , notice:"商品を削除しました"
  end

  def all_destroy
    @cart_products = current_user.cart_items.all
    @cart_products.destroy
    redirect_back(fallback_location: root_path) , notice:"カート内商品を全件削除しました"
  end

  private
  def cart_product_params
    params.require(:cart_product).permit(:quantity)
end

