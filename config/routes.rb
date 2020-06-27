Rails.application.routes.draw do
  devise_for :admin

  devise_for :customer

  root 'customer/homes#top'

  namespace :admin do
    root 'homes#top'

    resources :order_products, only: [:update]

    resources :orders, only: [:index,:show,:update]

    resources :customers, only: [:index,:show,:edit,:update]

    resources :product_categories, only: [:index,:create,:edit,:update]

    resources :products, only: [:index,:new,:create,:edit,:update,:show]

    get '/search', to: 'search#search'

  end

  namespace :customer do
    resources :cart_products, only: [:index, :create, :update, :destroy]
    delete 'cart_products/all_throw_away/:id' => 'cart_products#all_throw_away'

    resources :orders, only: [:index, :create, :new, :show, :edit, :update, :destroy]
    post 'order_confimation' => 'orders#order_confimation'
    get 'order/thanks' => 'orders#thanks'
    resources :deliveries, only: [:index, :create, :new, :edit, :update, :destroy]

    get 'products/category/:id' => 'products#category', as: 'category'
    get 'products/index'
    # get 'products/show'
    resources :products, only: [:new, :create, :show]

    resources :productcategories, only: [:new, :create,]

    get 'customers/leave' => 'customers#leave'
    # get 'customers/mypage/:id' =>'customers#show'
    resources :customers, only: [:edit, :show, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
    end
    # patch 'customers/update'
    # get 'customers/edit'
    get 'customers/delete_confimation/:id' =>'customers#delete_confimation', as: 'helf'


  end

end