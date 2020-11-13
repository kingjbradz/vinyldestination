Rails.application.routes.draw do
  resources :vinyls

  devise_for :users

  root to: "home#page"

  get 'listing/page', to: "listing#page"

  get "/contact", to: "contact#contact", as: "contact"

  get "/users/sign_up", to: "devise/registrations#new"

  post "/vinyls/:id/buy", to: "vinyls#buy", as: "buy"
  get "vinyls/:id/success", to: "vinyls#success", as: "success"
  get "vinyls/:id/cancel", to: "vinyls#cancel", as: "cancel"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end