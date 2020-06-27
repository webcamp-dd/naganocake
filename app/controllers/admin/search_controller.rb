class Admin::SearchController < ApplicationController
 before_action :authenticate_admin!

 def search
  @model = params["search"]["model"]
  @content = params["search"]["content"]
  @method = params["search"]["method"]
  @records = search_for(@model, @content, @method).page(params[:page]).per(10)
end

private
def search_for(model, content, method)
  if model == 'customer'
    if method == 'perfect'
      Customer.where(name: content)
    elsif method == 'forward'
      Customer.where('name LIKE ?', content+'%')
    elsif method == 'backward'
      Customer.where('name LIKE ?', '%'+content)
    else
      Customer.where('name LIKE ?', '%'+content+'%')
    end
  elsif model == 'product'
    if method == 'perfect'
      Product.where(name: content)
    elsif method == 'forward'
      Product.where('name LIKE ?', content+'%')
    elsif method == 'backward'
      Product.where('name LIKE ?', '%'+content)
    else
      Product.where('name LIKE ?', '%'+content+'%')
    end
  end
end
end
