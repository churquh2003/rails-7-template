class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def sort_by_name
    @users = User.order(:name)
  end

  def sort_by_email
    @users = User.order(:email)
  end
end
