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
  get '/about', to: 'customer/homes#about'
  resources :homes, :except => [:index, :create, :new, :edit, :show, :update, :destroy]
  devise_for :customers, :controllers => {
    :sessions => 'customers/sessions',
    :registrations => 'customers/registrations',
    :passwords => 'customers/passwords'
  }
  scope module: :customer do
    resources :items, only: [:index, :show]
    resource :customers, only: [:show, :edit, :update] do
      collection do
        get 'withdrawal'
        patch 'quit'
      end
    end

    delete "/cart_items/all_delete" => "cart_items#all_delete"
    resources :cart_items, only: [:index, :update, :create, :destroy]
    resources :orders, only: [:new, :index, :show, :create] do
      collection do
        post 'confirm'
        get 'thanks'
      end
    end
    resources :shipping_addresses, only: [:index, :edit, :create, :update, :destroy]
  end
end
