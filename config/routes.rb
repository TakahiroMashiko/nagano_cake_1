Rails.application.routes.draw do

  # admin
  devise_for :admins
  namespace :admin do
    resource :home, :except => [:index, :create, :new, :edit, :show, :update, :destroy]
    get  'top'=>'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update,]
    resources :orders, only: [:index, :show, :update]
    resource :order_details, only: [:update]
    # 任意実装 resources :genres, only: [:index, :create, :edit, :update, :show]
  end

  # Display the top screen of the application with "/"
  get '/', to: 'customer/homes#top' #'new_admin_session_path'
  # root path
  root :to => 'customer/homes#top'

  # customer
  devise_for :customers
  namespace :customer do
    resources :homes, :except => [:index, :create, :new, :edit, :show, :update, :destroy]
    get 'top' => 'customer/homes/top'
    get 'about' => 'customer/homes/about'
    get 'items/index'
    get 'items/show'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/withdrawal'
    get 'customers/quit'
    get 'cart_items/index'
    get 'cart_items/update'
    get 'cart_items/delete'
    get 'cart_items/all_delete'
    get 'cart_items/create'
    get 'orders/new'
    get 'orders/confirm'
    get 'orders/thanks'
    get 'orders/create'
    get 'orders/index'
    get 'orders/show'
    get 'shipping_addresses/index'
    get 'shipping_addresses/edit'
    get 'shipping_addresses/create'
    get 'shipping_addresses/update'
    get 'shipping_addresses/destroy'
  end
end
