Rails.application.routes.draw do
  # deviseでログインしている前提でそのほかのページを読めるので最初に持っていきたい
  namespace :admin do
    devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  end

  namespace :customer do
    devise_for :customers, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  end

  root 'customer/homes#top'

  # admin start
  namespace :admin do
    root 'homes#top'
    patch 'order_products/update'
    get 'orders/index'
    get 'orders/show'
    patch 'orders/update'

    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    patch 'customers/update'

    get 'product_categories/index'
    post 'product_categories/create'
    get 'product_categories/edit'
    patch 'product_categories/update'
    
    get 'products/index'
    get 'products/new'
    post 'products/create'
    get 'products/show'
    get 'products/edit'
    put 'products/update'
  end

  # admin
  
  # customer start
  namespace :customer do
    get 'cart_products/index'
    post 'cart_products/create'
    patch 'cart_products/update'
    delete 'cart_products/destroy'
    delete 'cart_products/all_destroy'

    get 'orders/index'
    get 'orders/new'
    get 'orders/order_confimation'
    post 'orders/create'
    get 'orders/show'
    get 'orders/thanks'
  
    get 'deliveries/index'
    post 'deliveries/create'
    patch 'deliveries/edit'
    get 'deliveries/show'
    patch 'deliveries/update'
    delete 'deliveries/destroy'
  
    get 'products/index'
    get 'products/show'
  
    get 'customers/leave' => 'customers#leave'
    get 'customers/mypage' =>'customers#show'
    patch 'customers/update'
    get 'customers/edit'
    get 'customers/delete_confimation' =>'customers#delete_confimation'


    # カート機能用
    post '/add_item' => 'cartproducts#add_item'
    post '/update_item' => 'cartproducts#update_item'
    delete '/delete_item' => 'cartproducts#delete_item'
  end
    
  #customer finish
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
