class CourseEvalController < ApplicationController
  def give_feedback

  end
  def get_feedback

  end
  def get_feedback_form
    @course_id=Course.find_by(:course_number=>params[:course][:course_number], :professor_id=> params[:course][:professor_id]).id

    redirect_to(:controller => 'prof_ratings', :action => 'new',:id=>params[:course][:professor_id])
  end


  def course_params
    params.require(:course).permit(:number,:professor_id)
  end

  def feedback_params
    params.permit(:id, :user_id, :num_of_exam, :num_of_project,:num_of_assignment,:fav_factor,:section_id,:job,:workload,:grade,:relate_course,:quality_of_lecture,:category)
  end


end
