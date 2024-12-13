Rails.application.routes.draw do
  resources :emails do
    collection do
      get :prioritize
      get :unsubscribe_links
    end
  end
  resources :users do
    collection do
      get 'sort_by_name', to: 'users#sort_by_name'
      get 'sort_by_email', to: 'users#sort_by_email'
    end
  end

  root "users#index"
end
