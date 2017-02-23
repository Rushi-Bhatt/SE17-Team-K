class CourseEvalController < ApplicationController
  def give_feedback

  end
  def get_feedback

  end
  def get_feedback_form
    @course_id=Course.find_by(:number=>params[:course][:number], :professor_id=> params[:course][:professor_id]).id
    redirect_to(:controller => 'course_eval', :action => 'show_feedback_form', :id=>@course_id)
  end

  def show_feedback_form
    @sec_id = params[:id]
  end

  def course_params
    params.require(:course).permit(:number,:professor_id)
  end
end
