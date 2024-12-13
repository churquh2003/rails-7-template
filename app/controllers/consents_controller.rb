class ConsentsController < ApplicationController
  before_action :authenticate_user!

  def new
    # Redirect to dashboard if already consented
    if current_user.consented?
      redirect_to user_emails_path, notice: "You have already provided consent."
    end
  end

  def create
    if current_user.update(consented: true)
      redirect_to user_emails_path, notice: "Thank you for providing consent!"
    else
      redirect_to new_consent_path, alert: "An error occurred. Please try again."
    end
  end
end

