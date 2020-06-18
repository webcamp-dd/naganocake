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

  # 商品一覧画面から、「商品購入」を押した時のアクション
  def add_item
    if @cart_item.blank?
      @cart_item = current_user.cart_items.build(product_id: params[:product_id])
    end

    @cart_item.quantity += params[:quantity].to_i
    @cart_item.save
    redirect_to current_cart
  end

  # カート詳細画面から、「更新」を押した時のアクション
  def update_item
    @cart_item.update(quantity: params[:quantity].to_i)
    redirect_to current_cart
  end

　# カート詳細画面から、「削除」を押した時のアクション
  def destroy
    @cart_item.destroy
    redirect_to current_cart
    redirect_back(fallback_location: root_path) , notice:"商品を削除しました"
  end


  def update
    @cart_product = CartProduct.find(params[:id])
    if @cart_product.update(cart_product_params)
      redirect_back(fallback_location: root_path) , notice:"カート情報を更新しました"
    else
      redirect_back(fallback_location: root_path) , notice:"カート情報が更新できませんでした"
    end

  end



  def all_destroy
    @cart_products = current_user.cart_items.all
    @cart_products.destroy
    redirect_back(fallback_location: root_path) , notice:"カート内商品を全件削除しました"
  end

  
  private

  def setup_cart_item!
    @cart_item = current_user.cart_items.find_by(product_id: params[:product_id])
  end

  def cart_product_params
    params.require(:cart_product).permit(:quantity)
end

