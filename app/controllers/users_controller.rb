class UsersController < ApplicationController
  before_action :logged_in?, only: [:show]
  def index
    @users = User.all
    render :index
  end
  def new
    @user = User.new
    render :new
  end
  def create
    @user = User.create(user_params)
    login(@user)
    redirect_to "/users/#{@user.id}"
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :email, :password)
  end
end
