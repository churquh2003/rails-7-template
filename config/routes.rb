Rails.application.routes.draw do
  resources :users do
    resources :emails do
      collection do
        get :prioritize
        get :unsubscribe_links
      end
    end
  end

  root "users#index"
end
