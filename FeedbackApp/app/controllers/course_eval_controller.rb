class CourseEvalController < ApplicationController
  def give_feedback

  end
  def get_feedback

  end
  def get_feedback_form
    @section_id=Section.find_by(:course_id=>params[:section][:course_id], :prof_id=> params[:section][:prof_id], :semester=> params[:section][:semester]).id
    redirect_to(:controller => 'course_eval', :action => 'show_feedback_form', :id=>@section_id)
  end

  def show_feedback_form
    @sec_id = params[:id]
  end

  def section_params
    params.require(:section).permit(:course_id,:prof_id,:semester)
  end
end
