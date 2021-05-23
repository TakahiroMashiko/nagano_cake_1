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

  # customer側の実装完了後に「root 'customer/homes#top'」に修正する
  # Display the top screen of the application with "/"
  get '/', to: 'admin/homes#top' #'new_admin_session_path'
  # customer側の実装完了後に「root :to => 'customer/homes#top'」に修正する
  # root path
  root :to => 'admin/homes#top'

  # customer
  devise_for :customers
  namespace :customer do
    get 'homes/top'
    get 'homes/about'
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
  end
end
