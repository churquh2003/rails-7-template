class EmailsController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @email = @user.emails.find(params[:id])
  end

  def index
    @emails = Email.all
  end

  def create
    @email = Email.new(email_params)
    if @email.save
      redirect_to @email, notice: 'Email was successfully created.'
    else
      render :new
    end
  end

  private

  def email_params
    params.require(:email).permit(:subject, :body, :recipient, :user_id)
  end
end

