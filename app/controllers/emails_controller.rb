class EmailsController < ApplicationController
  before_action :authenticate_user!

  def index
    @emails = current_user.emails
  end

  def new
    @email = Email.new
  end

  def create
    @email = current_user.emails.build(email_params)
    if @email.save
      redirect_to emails_path, notice: 'Email created successfully.'
    else
      render :new
    end
  end

  private

  def email_params
    params.require(:email).permit(:subject, :content)
  end
end
