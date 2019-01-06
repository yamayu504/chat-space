Rails.application.routes.draw do
  devise_for :users
  root  'groups#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'messages' =>  'messages#index'
  resources   :users,  only: [:edit, :update]
  resources   :groups, only: [:new, :update, :edit, :create] do
    resources :messages, only: [:new, :index]
  end
end
