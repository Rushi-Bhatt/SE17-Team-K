class FeedbacksController < ApplicationController
  @@prof_rating_id=0 , @@professor_id =0, @@course_number='0', @@user_id =0
  def new
    @feedback = Feedback.new
    @@prof_rating_id = params[:id].to_i
    @@professor_id = params[:prof_id].to_i
    @@course_number = params[:course_number]
    @@user_id = current_user.id
    @prof_rating = @@prof_rating_id

  end

  def create
    @tool_and_lang = params[:tool_and_lang].join(',')
    logger.info @tool_and_lang
    logger.info @@prof_rating_id
    logger.info @@professor_id
    logger.info @@course_number
    logger.info @@user_id
    @feedback_id = Feedback.new(:prof_rating_id=>@@prof_rating_id.to_i, :professor_id => @@professor_id.to_i,:user_id => @@user_id.to_i,:num_of_exam => params[:num_of_exam].to_i,:num_of_project => params[:num_of_project].to_i,:num_of_assignment=> params[:num_of_assignment].to_i,:tool_and_lang=>@tool_and_lang, :fav_factor=>params[:fav_factor].to_i,:course_number=>@@course_number,:job_relevance=> params[:job_relevance].to_i, :workload=>params[:workload].to_i, :grade=>params[:grade], :related_course=>"CSC517,CSC213", :quality_of_lecture=> params[:quality_of_lecture].to_i, :category=> params[:category].to_i)
    if @feedback_id.save
      #redirect to course feedback forrm with prof rating as a parameter
      redirect_to(:controller => 'feedbacks', :action => 'save')

    end

  end

  def save

  end

  def feedback_params
    params.permit(:id, :user_id, :course_number,:professor_id, :num_of_exam, :num_of_project,:num_of_assignment,:fav_factor,:tool_and_lang,:prof_rating_id,:job_relevance,:workload,:grade,:related_course,:quality_of_lecture,:category)
  end
end
