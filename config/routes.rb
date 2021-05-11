Rails.application.routes.draw do
  resources :plans
  resources :enterprises do
    patch '/upload', to: 'enterprises#upload'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
