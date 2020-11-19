Rails.application.routes.draw do
  resources :vinyls
  devise_for :users, :path_prefix => 'my'
  resources :users

  root to: "home#page"

  get 'listing/page', to: "listing#page"

  get "/contact", to: "contact#contact", as: "contact"


  get "/users/sign_up", to: "devise/registrations#new"
  delete "/users/:id", to: "users#destroy"

  post "/vinyls/:id/buy", to: "vinyls#buy", as: "buy"
  get "vinyls/:id/success", to: "vinyls#success", as: "success"
  get "vinyls/:id/cancel", to: "vinyls#cancel", as: "cancel"

  match '/500', to: "errors#internal_server_error", via: :all
  match '/404', to: "errors#not_found", via: :all
  get '*path', to: "errors#not_found"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end