class UsersController < ApplicationController
  # before_action :logged_in_user
  def show
    @user=User.find(params[:id])

  end
  def new
    @user=User.new
  end

  def create
     @user=User.new(user_params)
    if @user.save
      log_in @user
      flash[:success]="Welcome to our system"
      redirect_to home_path
    else
      render 'new'
    end
  end

  private

   def user_params
     params.require(:user).permit(:name,:email,:password,:password_confirmation)
   end
end
