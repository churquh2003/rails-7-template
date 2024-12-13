Rails.application.routes.draw do
  # Devise routes for user authentication
  devise_for :users

  # Root route - Redirect to records#index after sign-in
  root "records#index"

  # Routes for records (Capstone Project form handling)
  resources :records, only: [:index, :new, :create]

  # Routes for Users
  resources :users, only: [:index, :show] do
    collection do
      get 'sort_by_name'
      get 'sort_by_email'
    end
  end

  # Routes for Emails
  resources :emails, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    collection do
      get 'prioritize'
      get 'unsubscribe_links'
    end
  end
end
