class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new

  end

  def create

  end

  def save

  end

  def feedback_params
    params.permit(:id, :user_id, :num_of_exam, :num_of_project,:num_of_assignment,:fav_factor,:section_id,:job,:workload,:grade,:relate_course,:quality_of_lecture,:category)
  end

  def proper_course
    #@course_number=Feedback.findby(:num_of_exam=>params[:feedback][:num_of_exam], :num_of_project=>params[:feedback][:num_of_project], :num_of_assignment=>params[:feedback][:num_of_assignment], :tool_of_lang=>params[:feedback][:tool_and_lang],:job_relevance=>params[:feedback][:job_relevance],:workload=>params[:feedback][:workload], :grade=>params[:feedback][:grade], :category=>params[:feedback][:catogery]).course_id
    #@course_name=Course.findby(:id=>@course_number)
    @course_number='123'
    @course_name='software engineering'
    redirect_to show_suggestion_path( :course_number=>@course_number, :course_name=>@course_name)
  end

  def show_suggestion
  end

end
