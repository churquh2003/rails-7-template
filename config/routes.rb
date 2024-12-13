Rails.application.routes.draw do
  # Routes for Users
  resources :users do
    collection do
      get 'sort_by_name', to: 'users#sort_by_name'
      get 'sort_by_email', to: 'users#sort_by_email'
    end

    # Nested routes for Emails under Users
    resources :emails, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end

  # Routes for Emails (non-nested actions)
  resources :emails, only: [] do
    collection do
      get :prioritize
      get :unsubscribe_links
    end
  end

  # Root route
  root "users#index"
end

