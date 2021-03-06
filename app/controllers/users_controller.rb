class UsersController < ApplicationController

  before_action :require_signin, except: [:new, :create]
  before_action :require_correct_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @comments = @user.comments.reverse
    @liked_posts = @user.liked_posts
  end

  def new
    @user = User.new
  end

  def create
    @user = (user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to session[:intended_url]
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Account successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to root_url, alert: "Account successfully deleted!"
  end

private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end

  def guest_params
    params.permit(:username, :email);
  end

  def require_correct_user
    @user = User.find(params[:id])
    redirect_to root_url unless current_user?(@user)
  end

end
