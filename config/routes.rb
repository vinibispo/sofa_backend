Rails.application.routes.draw do
  resources :orders
  resources :addresses
  resources :users
  post '/sign_up', to: 'users#sign_up'
  resources :enterprises do
    patch '/upload', to: 'enterprises#upload'
    resources :plans do
      patch '/upload', to: 'plans#upload'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
