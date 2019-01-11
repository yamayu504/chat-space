Rails.application.routes.draw do
  devise_for :users
  root  'groups#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources   :users,  only: [:edit, :update]
  resources   :groups, only: [:new, :update, :edit, :create] do
    # new画面を必要としないため、createのみでよい。
    resources :messages, only: [:create, :index]
  end
end
