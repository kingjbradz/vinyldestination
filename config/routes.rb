Rails.application.routes.draw do
  resources :vinyls
  devise_for :users
  root "home#page"

  get "/contact", to: "contact#contact", as: "contact"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
