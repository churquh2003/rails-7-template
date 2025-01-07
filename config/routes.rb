Rails.application.routes.draw do
  # Devise routes for user authentication
  devise_for :users

  # Root route - Redirect to user_emails#index after sign-in
  root "user_emails#index"

  # Routes for user_emails (Capstone Project form handling)
  resources :user_emails, only: [:index, :new, :create]

  # Routes for consent
  resource :consent, only: [:new, :create]

  # Routes for Users
  resources :users, only: [:index, :show] do
    collection do
      get 'sort_by_name'
      get 'sort_by_email'
    end
  end

  # Routes for Emails (if still relevant for a legacy project)
  resources :emails, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    collection do
      get 'prioritize'
      get 'unsubscribe_links'
    end

  resources :users do
    resources :user_emails, only: [:show]
    end
  end
end
