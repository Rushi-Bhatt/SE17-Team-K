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
<<<<<<< HEAD
    params.permit(:id, :user_id, :num_of_exam, :num_of_project,:num_of_assignment,:fav_factor,:section_id,:job,:workload,:grade,:relate_course,:quality_of_lecture,:category, :tool_and_lang)
=======
    params.permit(:id, :user_id, :course_number,:professor_id, :num_of_exam, :num_of_project,:num_of_assignment,:fav_factor,:tool_and_lang,:prof_rating_id,:job_relevance,:workload,:grade,:related_course,:quality_of_lecture,:category)
>>>>>>> eff78bfe8216928653547c0905d73089fea2d8d5
  end

  def proper_course
    exam = params[:feedback][:num_of_exam]
    if exam.to_i == 0
      @fb1 = Feedback.all
    else
      @fb1 = Feedback.where(num_of_exam: params[:feedback][:num_of_exam])
    end
    project = params[:feedback][:num_of_project]
    if project.to_i == 0
       @fb2 = @fb1.all
    else
      @fb2 = @fb1. where(num_of_project: params[:feedback][:num_of_project])
    end
    assignment = params[:feedback][:num_of_assignment]
    if assignment.to_i == 0
      @fb3 = @fb2.all
    else
      @fb3 = @fb2. where(num_of_assignment: params[:feedback][:num_of_assignment])
    end
    job = params[:feedback][:job_relevance]
    if job.to_i == 0
      @fb4 = @fb3.all
    else
      @fb4 = @fb3. where(job_relevance: params[:feedback][:job_relevance])
    end
    work= params[:feedback][:workload]
    if work.to_i == 0
      @fb5 = @fb4.all
    else
      @fb5 = @fb4. where(workload: params[:feedback][:workload])
    end
    cate = params[:feedback][:category]
    if cate.to_i == 0
      @fb6 = @fb5.all
    else
      @fb6 = @fb5. where(category: params[:feedback][:category])
    end
    tools = params[:tool_and_lang]
    str = ""
    tools.each do |tool|
      if str == ""
        str += tool.
      else if str != ""
        str += ","
        str += tool
      end
    end
    #@fb = @fb6.all
    @fb = @fb6.where(tool_and_lang: str)
    #@fb = Feedback.where(num_of_exam: params[:feedback][:num_of_exam], num_of_project: params[:feedback][:num_of_exam], num_of_assignment: params[:feedback][:num_of_assignment], job_relevance: params[:feedback][:job_relevance], workload: params[:feedback][:workload], category: params[:feedback][:category] )
    end
end

