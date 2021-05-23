Rails.application.routes.draw do

  # admin
  devise_for :admins
  namespace :admin do
    resource :home, :except => [:index, :create, :new, :edit, :show, :update, :destroy]
    get  'top'=>'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resource :order_details, only: [:update]
    # 任意実装 resources :genres, only: [:index, :create, :edit, :update, :show]
  end

  # Display the top screen of the application with '/'
  get '/', to: 'customer/homes#top'
  # root path
  root :to => 'customer/homes#top'

  # customer
  devise_for :customers
  namespace :customer do
    resources :homes, :except => [:index, :create, :new, :edit, :show, :update, :destroy]
    get 'top' => 'customer/homes/top'
    get 'about' => 'customer/homes/about'
    resources :items, only: [:index, :show]
    resources :customers, only: [:show, :edit, :update] do
      collection do
        get 'withdrawal'
        patch 'quit'
      end
    end
    resources :cart_items,only: [:index, :update, :create] do
      collection do
        delete 'delete'
        # all_deleteは後から実装
      end
    end
    resources :orders,only: [:new, :index, :show, :create] do
      collection do
        post 'confirm'
        get 'thanks'
      end
    end
    get 'shipping_addresses/index'
    get 'shipping_addresses/edit'
    get 'shipping_addresses/create'
    get 'shipping_addresses/update'
    get 'shipping_addresses/destroy'
  end
end
