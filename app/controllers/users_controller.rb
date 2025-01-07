class UsersController < ApplicationController
  before_action :authenticate_user!
  has_many :user_emails

  def index
    @users = User.all
  end

  def sort_by_name
    @users = User.order(:name)
  end

  def sort_by_email
    @users = User.order(:email)
  end

  def user_emails
    # Logic to fetch user emails, e.g., return an array of email addresses
    ["email1@example.com", "email2@example.com"]
  end

  def create
    Rails.logger.debug "Current User: #{current_user.inspect}"
  
    if current_user.update(consented: true)
      redirect_to user_emails_path, notice: "Thank you for providing consent!"
    else
      redirect_to new_consent_path, alert: "An error occurred. Please try again."
    end
  end
  
  
end
