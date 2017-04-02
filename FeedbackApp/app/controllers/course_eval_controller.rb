class CourseEvalController < ApplicationController
  @@fav_factor_map={
      1=> "Instructor",
      2=>"Project/Assignments",
      3=>"Course Material",
      4=> "Grading"
  }
  @@workload_map={
      1=> "4-5",
      2=>"7-8",
      3=>"10-12"
  }
  @@job_relevance_map={
      0=>"Not at all relevant",
      1=>"Not relevant",
      2=>"Somewhat relevant",
      3=>"relevant",
      4=>"Highly relevant"
  }
  @@quality_of_lecture_map={
      0=>"Bad",
      1=>"Not good",
      2=>"Neutral",
      3=>"Good",
      4=>"Impressive"
  }
  @@category_map={
      1=>"System",
      2=>"Design",
      3=>"Networks",
      4=>"Software engineering",
      5=>"Data Science",
      6=>"Other"
  }
  @@tagetObject={}
  @@mapObject={}
  public
  def mapper
    @map = @@mapObject
    @target=@@tagetObject
    @newTarget = {}
    @target.each do |key,value|
      @newTarget[@map[key]] = value
    end
    @newTarget
  end


  def give_feedback

  end
  def get_feedback

  end

  def get_feedback_result
    #Strategy 1 - Find the most common value and display it for now.. later we can consider the average or median
    #All the feedbacks of that particular course and professor
    @feedback_results=Feedback.where(:course_number=>params[:course][:course_number], :professor_id=> params[:course][:id])
    logger.info @feedback_results

    @num_of_exam = @feedback_results.group(:num_of_exam).order('count_id DESC').count(:id)
    logger.info @num_of_exam

    @num_of_project = @feedback_results.group(:num_of_project).order('count_id DESC').count(:id)
    logger.info @num_of_project

    @num_of_assignment = @feedback_results.group(:num_of_assignment).order('count_id DESC').count(:id)
    logger.info @num_of_assignment

    @fav_factor = @feedback_results.group(:fav_factor).order('count_id DESC').count(:id)
    @@mapObject=@@fav_factor_map
    @@tagetObject=@fav_factor
    @fav_factor = self.mapper()
    logger.info @fav_factor

    @prof_rating_id = @feedback_results.group(:prof_rating_id).order('count_id DESC').count(:id)
    @prof_rating={}
    @count=0
    @fluency=0
    @course_material =0
    @knowledge = 0
    @doubt_solving = 0
    @prof_rating_id.each do |key,value|
      @count=@count+1
      @rating = ProfRating.find_by(:id=>key)
      @fluency= @fluency +@rating.fluency
      @course_material= @course_material+@rating.course_material
      @knowledge= @knowledge+@rating.knowledge
      @doubt_solving= @doubt_solving+@rating.doubt_solving
    end
    logger.info  @count
    @fluency = @fluency*100/(@count*4)
    @course_material= @course_material*100/(@count*4)
    @knowledge= @knowledge*100/(@count*4)
    @doubt_solving= @doubt_solving*100/(@count*4)
    @prof_rating['fluency']=@fluency
    @prof_rating['course_material']= @course_material
    @prof_rating['knowledge']=@knowledge
    @prof_rating['doubt_solving']=@doubt_solving
    logger.info @prof_rating_id

    @job_relevance = @feedback_results.group(:job_relevance).order('count_id DESC').count(:id)
    @@mapObject=@@job_relevance_map
    @@tagetObject=@job_relevance
    @job_relevance = self.mapper()
    logger.info @job_relevance

    @workload = @feedback_results.group(:workload).order('count_id DESC').count(:id)
    @@mapObject=@@workload_map
    @@tagetObject=@workload
    @workload = self.mapper()
    logger.info @workload

    @grade = @feedback_results.group(:grade).order('count_id DESC').count(:id)
    logger.info @grade

    @quality_of_lecture = @feedback_results.group(:quality_of_lecture).order('count_id DESC').count(:id)
    @@mapObject=@@quality_of_lecture_map
    @@tagetObject=@quality_of_lecture
    @quality_of_lecture = self.mapper()
    logger.info @quality_of_lecture

    @category = @feedback_results.group(:category).order('count_id DESC').count(:id)
    @@mapObject=@@category_map
    @@tagetObject=@category
    @category = self.mapper()
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
    @course_id=Course.find_by(:course_number=>params[:course][:course_number], :professor_id=> params[:course][:id]).id

    redirect_to(:controller => 'prof_ratings', :action => 'new', :prof_id=>params[:course][:id],:course_number=>params[:course][:course_number])
  end

  def course_params
    params.require(:course).permit(:number,:professor_id)
  end

  def feedback_params
    params.permit(:id, :user_id, :num_of_exam, :num_of_project,:num_of_assignment,:fav_factor,:section_id,:job,:workload,:grade,:relate_course,:quality_of_lecture,:category)
  end


end
