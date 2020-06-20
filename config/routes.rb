Rails.application.routes.draw do
  devise_for :admin

  devise_for :customer

  
  root 'customer/homes#top'



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
    # get 'products/show'
    resources :products, only: [:new, :create, :show]

    resources :productcategories, only: [:new, :create,]

    get 'customers/leave' => 'customers#leave'
    # get 'customers/mypage/:id' =>'customers#show'
    resources :customers, only: [:edit, :show, :update]
    # patch 'customers/update'
    # get 'customers/edit'
    get 'customers/delete_confimation' =>'customers#delete_confimation'


    
    post '/add_item' => 'cartproducts#add_item'
    post '/update_item' => 'cartproducts#update_item'
    delete '/delete_item' => 'cartproducts#delete_item'
  end

  
end