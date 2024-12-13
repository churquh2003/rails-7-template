class UserEmailsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @user_email = UserEmail.new
  end
  
  def create
    @user_email = current_user.user_emails.build(user_email_params)
    if @user_email.save
      redirect_to user_emails_path, notice: 'Email was successfully saved.'
    else
      render :new
    end
  end
  
  def index
    @user_emails = current_user.user_emails
  end
  
  private
  
  def user_email_params
    params.require(:user_email).permit(:subject, :content)
  end
end
