Rails.application.routes.draw do
  resources :educational_institutions, only: %i(index new create update show edit destroy) do
    resources :specialities, shallow: true do
      resources :disciplines, shallow: true
    end
  end

  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "educational_institutions#index"
end
