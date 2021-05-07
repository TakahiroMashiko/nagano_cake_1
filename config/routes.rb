Rails.application.routes.draw do

  # admin
  devise_for :admins
  namespace :admin do
    resource :home, :except => [:index, :create, :new, :edit, :show, :update, :destroy]
    get  'top'=>'homes#top'
    ## コントローラー作成時に併せて生成されたルーティング、最後に削除する
    # get 'order_details/update'
    # get 'orders/index'
    # get 'orders/update'
    # get 'genres/index'
    # get 'genres/create'
    # get 'genres/edit'
    # get 'genres/update'
    # get 'items/index'
    # get 'items/new'
    # get 'items/create'
    # get 'items/show'
    # get 'items/edit'
    # get 'items/update'
    # get 'homes/top'
    # get 'customers/index'
    # get 'customers/show'
    # get 'customers/edit'
    # get 'customers/update'
  end
  # customer
  devise_for :customers
end
