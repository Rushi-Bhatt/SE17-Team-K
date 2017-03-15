class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new

  end

  def create

  end

  def save

  end

  def feedback_params
    params.permit(:id, :user_id, :num_of_exam, :num_of_project,:num_of_assignment,:fav_factor,:section_id,:job,:workload,:grade,:relate_course,:quality_of_lecture,:category, :tool_and_lang)
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

