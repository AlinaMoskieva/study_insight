Rails.application.routes.draw do
  resources :universities, only: %i(index new create update show edit destroy) do
    resources :institutions, shallow: true do
      resources :departments, shallow: true do
        resources :curriculums, shallow: true do
          resources :disciplines, shallow: true do
            resources :discipline_programs, shallow: true
          end
        end
      end
    end
  end

  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "universities#index"
end
