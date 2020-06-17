Rails.application.routes.draw do

  # admin start
  namespace :admin do
    get 'admin' => 'home#top'
  end
  namespace :admin do
    patch 'order_products/update'
  end
  namespace :admin do
    get 'orders/index'
    get 'orders/show'
    patch 'orders/update'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    patch 'customers/update'
  end
  namespace :admin do
    get 'product_categories/index'
    post 'product_categories/create'
    get 'product_categories/edit'
    patch 'product_categories/update'
  end
  namespace :admin do
    get 'products/index'
    get 'products/new'
    post 'products/create'
    get 'products/show'
    get 'products/edit'
    put 'products/update'
  end

  # admin finish

  # customer start
  namespace :customer do
    get 'cart_products/index'
    post 'cart_products/create'
    patch 'cart_products/update'
    delete 'cart_products/destroy'
    delete 'cart_products/all_destroy'
  end
  namespace :customer do
    get 'orders/index'
    get 'orders/new'
    post 'orders/create'
    get 'orders/show'
    get 'orders/thanks'
  end
  namespace :customer do
    get 'deliveries/index'
    post 'deliveries/create'
    patch 'deliveries/edit'
    get 'deliveries/show'
    patch 'deliveries/update'
    delete 'deliveries/destroy'
  end
  namespace :customer do
    get 'products/index'
    get 'products/show'
  end
  namespace :customer do
    get 'customers/leave' => 'customers#leave'
    get 'customers/mypage' =>'customers#show'
    patch 'customers/update'
    get 'customers/edit'
    get 'customers/delete_confimation' =>'customers#delete_confimation'
  end
  namespace :customer do
    root 'homes#top'
  end

  #customer finish
  
  devise_for :admins 
  devise_for :customers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
