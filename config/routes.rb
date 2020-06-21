Rails.application.routes.draw do
  devise_for :admin

  devise_for :customer

  root 'customer/homes#top'



  namespace :admin do
    root 'homes#top'

    resources :order_products, only: [:update]
    # patch 'order_products/update'

    resources :orders, only: [:index,:show,:update]
    # get 'orders/index'
    # get 'orders/show'
    # patch 'orders/update'

resources :customers, only: [:index,:show,:edit,:update]
    # get 'customers/index'
    # get 'customers/show'
    # get 'customers/edit'
    # patch 'customers/update'

    resources :product_categories, only: [:index,:create,:edit,:update]
    # get 'product_categories/index'
    # post 'product_categories/create'
    # get 'product_categories/edit'
    # patch 'product_categories/update'

    resources :products, only: [:index,:new,:create,:edit,:update,:show]
    # get 'products/index'
    # get 'products/new'
    # post 'products/create'
    # get 'products/show'
    # get 'products/edit'
    # put 'products/update'
  end

  namespace :customer do
    get 'cart_products/index'
    post 'cart_products/create'
    patch 'cart_products/update'
    delete 'cart_products/destroy'
    delete 'cart_products/all_destroy'

    resources :orders, only: [:index, :create, :new, :show, :order_confimation, :thanks, :edit, :update, :destroy]
    resources :deliveries, only: [:index, :create, :new, :edit, :update, :destroy]
    
    get 'products/category/:id' => 'products#category'
    get 'products/index'
    # get 'products/show'
    resources :products, only: [:new, :create, :show]

    resources :productcategories, only: [:new, :create,]

    get 'customers/leave' => 'customers#leave'
    # get 'customers/mypage/:id' =>'customers#show'
    resources :customers, only: [:edit, :show, :update, :destroy]
    # patch 'customers/update'
    # get 'customers/edit'
    get 'customers/delete_confimation/:id' =>'customers#delete_confimation'


    
    post '/add_item' => 'cartproducts#add_item'
    post '/update_item' => 'cartproducts#update_item'
    delete '/delete_item' => 'cartproducts#delete_item'
  end

  
end