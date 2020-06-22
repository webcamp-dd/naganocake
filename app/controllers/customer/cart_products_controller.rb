class Customer::CartProductsController < ApplicationController
  before_action :authenticate_customer! 


  def index
    @cart_products = current_customer.cart_products
    @numbers = CartProduct.all

  end

 # 商品一覧画面から、「商品購入」を押した時のアクション
  def create
    @cart_product = CartProduct.new(product_id: params[:product_id], quantity: params[:cart_product][:quantity])
    @cart_product.customer_id = current_customer.id
# ストロングパラメータを設定する必要あり　そもそもViewから持ってくるものはSaveできない。
    @cart_product.save
    flash[:notice] = 'カートに商品を追加しました'
    redirect_to customer_cart_products_path
  end


  # カート詳細画面から、「更新」を押した時のアクション
  def update
    @cart_product = CartProduct.find(params[:id])
    if  @cart_product.update(quantity: params[:quantity].to_i)
      flash[:notice] = 'カート情報を更新しました'
      redirect_to customer_cart_products_path
    else
      flash[:notice] = 'カート情報が更新できませんでした'
      redirect_to customer_cart_products_path
    end

  end


 # カート詳細画面から、「削除」を押した時のアクション
  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    flash[:notice] = '商品を削除しました'
    redirect_to customer_cart_products_path
    
  end

  

  def all_destroy
    @cart_products = current_customer.cart_products.all
    @cart_products.destroy
    flash[:notice] = 'カート内商品を全件削除しました'
    redirect_back(fallback_location: root_path)
  end

  
  private

  def setup_cart_product!
    @cart_product = current_customer.cart_items.find_by(product_id: params[:product_id])
  end
end
