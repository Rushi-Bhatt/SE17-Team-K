class CoursesController < ApplicationController

  def search_course
    @courses =Course.where(:course_number => course_params[:course_number], :professor_id => course_params[:id])
  end

  def show_course

  end



  def show_review
    @course = Course.find(params[:id])
    if logged_in?
      @review = @course.reviews.build
      @review_items = @course.feed.paginate(page: params[:page])
    end
  end


end

  private

  def course_params
    params.require(:course).permit(:course_number, :id)
  end