class ReviewsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @course = Course.find(params[:course_id])
    @review = @course.reviews.build(review_params)

    if @review.save
      flash[:success] = "Review created!"
      redirect_to show_review_path
    else
      @review_items = []
      render 'home_page/home'
    end
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:course_id, :user_id, :content, :likes, :dislikes)
  end
end
