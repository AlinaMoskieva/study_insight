Rails.application.routes.draw do
  resources :educational_institutions
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "educational_institutions#index"
end
