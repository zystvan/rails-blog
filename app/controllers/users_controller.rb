class UsersController < ApplicationController
  before_action :require_logged_out, only: :new
  
  def edit
    @user = current_user if current_user
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      
      redirect_to root_url, :notice => 'Account created!'
    else
      redirect_to '/signup'
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end