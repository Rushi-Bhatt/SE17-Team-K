class SessionsController < ApplicationController
  def new
  end

  def create
    user=User.find_by(email: params[:sessions][:email].downcase)
    if user && user.authenticate(params[:sessions][:password])
      redirect_to root_path
    else
      flash[:danger]='Wrong email/password'
      render 'new'
    end
  end

  def current_user
     @current_user||=User.find_by(id: session[:user_id])
  end

  def destory
  end
end
