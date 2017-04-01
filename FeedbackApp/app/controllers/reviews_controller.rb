class ReviewsController < ApplicationController
  before_action :logged_in_user

  def create
    @course = Course.find(params[:course_id])
    @review = @course.reviews.build(review_params)

    if @review.save
      flash[:success] = "Review created!"
      redirect_to show_review_path(:id => params[:course_id])
    else
      @review_items = []
      render 'home_page/home'
    end
  end

  def destroy
  end

  def like
    @vote = Vote.where(user_id: params[:user_id], review_id: params[:review_id])
    if !@vote.ids.present?
      @vote = Vote.new(user_id: params[:user_id], review_id: params[:review_id], like: 1, dislike: 0)
      if @vote.save
        @review = Review.find(params[:review_id])
        @review.update_attributes(likes: @review.likes+1)
      end
    end
    redirect_to show_review_path(:id => params[:course_id])
  end

  def dislike
    @vote = Vote.where(user_id: params[:user_id], review_id: params[:review_id])
    if !@vote.ids.present?
      @vote = Vote.new(user_id: params[:user_id], review_id: params[:review_id], like: 0, dislike: 1)
      if @vote.save
        @review = Review.find(params[:review_id])
        @review.update_attributes(dislikes: @review.dislikes+1)
      end
    end
    redirect_to show_review_path(:id => params[:course_id])
  end

  private

  def review_params
    params.require(:review).permit(:course_id, :user_id, :content, :likes, :dislikes)
  end
end
