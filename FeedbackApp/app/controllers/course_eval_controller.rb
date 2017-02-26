class CourseEvalController < ApplicationController
  def give_feedback

  end
  def get_feedback

  end
  def get_feedback_form
    @course_id=Course.find_by(:course_number=>params[:course][:course_number], :professor_id=> params[:course][:professor_id]).id

    redirect_to(:controller => 'course_eval', :action => 'show_feedback_form', :id=>@course_id)
  end

  def post_feedback_form
    @prof_rating = ProfRating.new(prof_ratings_params)
    if @prof_rating.save
        redirect_to :action=>'give_feedback'
      end
  end

  def show_feedback_form
    @sec_id = params[:id]
  end

  def course_params
    params.require(:course).permit(:number,:professor_id)
  end
  def feedback_params
    params.permit(:id, :user_id, :num_of_exam, :num_of_project,:num_of_assignment,:fav_factor,:section_id,:job,:workload,:grade,:relate_course,:quality_of_lecture,:category)
  end

  def prof_ratings_params
    params.permit(:tool_and_lang, :fluency, :course_material, :knowledge, :helpful)
  end
end
