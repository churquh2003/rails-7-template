Rails.application.routes.draw do
  resources :users do
    resources :emails
  end

  root "users#index"
end
