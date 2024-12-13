class UsersController < ApplicationController
  # Callbacks
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/:id
  def show
    @emails = @user.emails # Assuming a user has many emails
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /users/:id/edit
  def edit; end

  # PATCH/PUT /users/:id
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

  # Callback to set user for certain actions 
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters 
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
