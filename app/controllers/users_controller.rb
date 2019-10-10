class UsersController < ApplicationController
  
  before_action :logged_in_user, only: [:edit, :update, :following, :followers, :destroy]
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.all.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "welcome"
      redirect_to @user
    else
      render 'new'
    end
  end

def update
  if @users.update_attributes(user_params)
    flash[:success] = "updated"
    redirect_to @user
  else
    render 'edit'
  end
end

def edit
end

def following
  @title = "Following"
  @user = User.find(params[:id])
  @users = @user.following.paginate(page: params[:page])
  render 'show_follow'
end

def followers
  @title = "Followers"
  @user = User.find(params[:id])
  @users = @user.followers.paginate(page: params[:page])
  render 'show_follow'
end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to(root_url) 
    end
  end



end
