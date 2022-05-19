Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'users/index'
    end
  end
  root to: 'home#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
