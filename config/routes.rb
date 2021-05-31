Rails.application.routes.draw do

  # admin
  devise_for :admins
  namespace :admin do
    root :to =>'homes#top'
    resource :home, :except => [:index, :create, :new, :edit, :show, :update, :destroy]
    resources :customers, only: [:index, :edit, :show, :update]
    resources :items, except: [:destroy]
    resources :orders, only: [:show, :update]
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

  devise_for :customers, skip: :all
  devise_scope :customer do
    get 'customers/sign_up' => 'devise/registrations#new', as: :new_customer_registration
    post 'customers/sign_up' => 'devise/registrations#create', as: :customer_registration
    get 'customers/sign_in' => 'devise/sessions#new', as: :new_customer_session
    post 'customers/sign_in' => 'devise/sessions#create', as: :customer_session
    delete '/customers/sign_out' => 'devise/sessions#destroy', as: :destroy_customer_session
  end

  scope module: :customer do
    resources :items, only: [:index, :show]
    resource :customers, only: [:edit, :show, :update] do
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
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end
end
