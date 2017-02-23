class CoursesController < ApplicationController
  def show
    @course = Course.find(params[:id])
  end

  def search_course
    number = course_params[:number]
    prof = course_params[:professor_id]

    if number.size==0&&prof.size==0
      @courses = Course.all
    elsif number.size!=0&&prof.size==0
      @courses =Course.where(number: course_params[:number])
    elsif number.size==0&&prof.size!=0
      @courses =Course.where(professor_id: course_params[:professor_id])
    else
      @courses =Course.where(number: course_params[:number], professor_id: course_params[:professor_id])
    end
  end

  def show_course

  end

  def show_review
    @course = Course.find(params[:id])
    if logged_in?
      @review = @course.reviews.build
      @feed_items = @course.feed.paginate(page: params[:page])
    end
  end

  def feed
    Review.where("course_id = ?", id)
  end
end

  private

  def course_params
    params.require(:course).permit(:number, :professor_id)
  end