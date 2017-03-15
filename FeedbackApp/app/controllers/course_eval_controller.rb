class CourseEvalController < ApplicationController
  def give_feedback

  end
  def get_feedback

  end

  def get_feedback_result
    #Strategy 1 - Find the most common value and display it for now.. later we can consider the average or median
    #All the feedbacks of that particular course and professor
    @feedback_results=Feedback.where(:course_number=>params[:course][:course_number], :professor_id=> params[:course][:professor_id])
    logger.info @feedback_results

    @num_of_exam = @feedback_results.group(:num_of_exam).order('count_id DESC').count(:id)
    logger.info @num_of_exam

    @num_of_project = @feedback_results.group(:num_of_project).order('count_id DESC').count(:id)
    logger.info @num_of_project

    @num_of_assignment = @feedback_results.group(:num_of_assignment).order('count_id DESC').count(:id)
    logger.info @num_of_assignment

    @fav_factor = @feedback_results.group(:fav_factor).order('count_id DESC').count(:id)
    logger.info @fav_factor

    @prof_rating_id = @feedback_results.group(:prof_rating_id).order('count_id DESC').count(:id)
    logger.info @prof_rating_id

    @job_relevance = @feedback_results.group(:job_relevance).order('count_id DESC').count(:id)
    logger.info @job_relevance

    @workload = @feedback_results.group(:workload).order('count_id DESC').count(:id)
    logger.info @workload

    @grade = @feedback_results.group(:grade).order('count_id DESC').count(:id)
    logger.info @grade

    @quality_of_lecture = @feedback_results.group(:quality_of_lecture).order('count_id DESC').count(:id)
    logger.info @quality_of_lecture

    @category = @feedback_results.group(:category).order('count_id DESC').count(:id)
    logger.info @category

    tl_array=[] #tools and languages array
    rc_array=[] #related course array
    @feedback_results.each do |fr|
      tl_array.concat(fr.tool_and_lang.split(','))
      rc_array.concat(fr.related_course.split(','))
    end
    logger.info tl_array
    logger.info rc_array
    @tool_and_lang = Hash.new(0)
    @related_course = Hash.new(0)
    tl_array.each{|key| @tool_and_lang[key] += 1}
    rc_array.each{|key| @related_course[key] += 1}
    logger.info @tool_and_lang
    logger.info @related_course

    end
  def get_feedback_form
    @course_id=Course.find_by(:course_number=>params[:course][:course_number], :professor_id=> params[:course][:professor_id]).id

    redirect_to(:controller => 'prof_ratings', :action => 'new', :prof_id=>params[:course][:professor_id],:course_number=>params[:course][:course_number])
  end

  def course_params
    params.require(:course).permit(:number,:professor_id)
  end

  def feedback_params
    params.permit(:id, :user_id, :num_of_exam, :num_of_project,:num_of_assignment,:fav_factor,:section_id,:job,:workload,:grade,:relate_course,:quality_of_lecture,:category)
  end


end
