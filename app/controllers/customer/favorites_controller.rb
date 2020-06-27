class Customer::FavoritesController < ApplicationController
    def create
        product = Product.find(params[:product_id])
        favorite = product.favorites.new(customer_id: current_customer.id)
        favorite.save
        redirect_to request.referer
      end
    
      def destroy
        product = Product.find(params[:product_id])
        favorite = current_customer.favorites.find_by(product_id: product.id)
        favorite.destroy
        redirect_to request.referer
      end
    
      # private
      # def redirect
      #   case params[:redirect_id].to_i
      #   when 0
      #     redirect_to customer_products_index
      #   when 1
      #     redirect_to customer_product(product)
      #   end
      # end
end
