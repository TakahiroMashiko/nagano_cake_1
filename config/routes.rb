Rails.application.routes.draw do

  # admin
  devise_for :admins
  namespace :admin do
    resource :home, :except => [:index, :create, :new, :edit, :show, :update, :destroy]
    get  'top'=>'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
  end

  # customer
  devise_for :customers
end
