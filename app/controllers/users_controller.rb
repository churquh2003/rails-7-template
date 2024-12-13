class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def sort_by_email
    @users = User.order(:email)
    render :index # Explicitly render the `index` view or a specific view
  end

  def sort_by_name
    @users = User.order(:name)
    render :index
  end

  # GET /users
def index
  @users = User.all
  @users = @users.order(name: :asc) if params[:filter] == 'name'
  @users = @users.order(email: :asc) if params[:filter] == 'email'
end

  # GET /users/:id
  def show
    @emails = @user.emails # Display emails for the selected user
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

  # Find user for actions
  def set_user
    @user = User.find(params[:id])
  end

  # Permit allowed parameters
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end

 
  