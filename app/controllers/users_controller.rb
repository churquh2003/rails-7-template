class UsersController < ApplicationController
before_action :set_user, only: %i[show edit update destroy]

# GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

# GET /users/:id
  def show
    render json: @user, status: :ok
  end

# POST /users
  def create
    @user = User.new(user_params)
    if @user.save
     render json: @user, status: :created
   else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

# PATCH/PUT /users/:id
  def update
    if @user.update(user_params)
      render json: @user, status: :ok
    else
     render json: @user.errors, status: :unprocessable_entity
    end
  end

# DELETE /users/:id
  def destroy
    if @user.destroy
     render json: { message: 'User deleted successfully' }, status: :ok
    else
     render json: { error: 'Failed to delete user' }, status: :unprocessable_entity
    end
  end

# GET /users/sort_by_name
  def sort_by_name
    @users = User.order(:name)
    render json: @users, status: :ok
  end

# GET /users/sort_by_email
  def sort_by_email
   @users = User.order(:email)
   render json: @users, status: :ok
  end

private

# Find user for actions
  def set_user
    @user = User.find(params[:id])
  end

# Permit allowed parameters
  def user_params
   params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
