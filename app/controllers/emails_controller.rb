class EmailsController < ApplicationController
  before_action :set_user
  before_action :set_email, only: %i[show edit update destroy]

  # GET /users/:user_id/emails
  def index
    @emails = @user.emails
  end

  # GET /users/:user_id/emails/:id
  def show; end

  # GET /users/:user_id/emails/new
  def new
    @email = @user.emails.new
  end

  # POST /users/:user_id/emails
  def create
    @email = @user.emails.new(email_params)
    if @email.save
      redirect_to user_emails_path(@user), notice: 'Email was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # DELETE /users/:user_id/emails/:id
  def destroy
    @email.destroy
    redirect_to user_emails_path(@user), notice: 'Email was successfully deleted.'
  end

  private

  # Find the user to scope emails
  def set_user
    @user = User.find(params[:user_id])
  end

  # Find the specific email within the user's emails
  def set_email
    @email = @user.emails.find(params[:id])
  end

  # Permit only the allowed parameters
  def email_params
    params.require(:email).permit(:subject, :body, :recipient)
  end
end

