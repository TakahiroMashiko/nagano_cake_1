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

  # customer側の実装完了後に「root 'customer/homess#top'」に修正する
  # Display the top screen of the application with "/"
  get '/', to: 'admin/homes#top' #'new_admin_session_path'
  # customer側の実装完了後に「root :to => 'customer/homess#top'」に修正する
  # root path
  root :to => 'admin/homes#top'

  # customer
  devise_for :customers
end
