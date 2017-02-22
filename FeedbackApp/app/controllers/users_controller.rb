class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.paginate(page: params[:page])  #split results by pages
  end
end
