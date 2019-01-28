Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :blogs #do
  resources :posts do #, shallow: true
    resources :comments, except: [:show]
  end
end
