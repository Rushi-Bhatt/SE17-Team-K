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
    @related_course = params[:related_course].join(',')
    logger.info @related_course
    logger.info @tool_and_lang
    logger.info @@prof_rating_id
    logger.info @@professor_id
    logger.info @@course_number
    logger.info @@user_id

    logger.info params
    @feedback_id = Feedback.new(:prof_rating_id=>@@prof_rating_id.to_i, :professor_id => @@professor_id.to_i,:user_id => @@user_id.to_i,:num_of_exam => params[:feedback][:num_of_exam].to_i,:num_of_project => params[:feedback][:num_of_project].to_i,:num_of_assignment=> params[:feedback][:num_of_assignment].to_i,:tool_and_lang=>@tool_and_lang, :fav_factor=>params[:fav_factor].to_i,:course_number=>@@course_number,:job_relevance=> params[:feedback][:job_relevance].to_i, :workload=>params[:workload].to_i, :grade=>params[:grade], :related_course=>@related_course, :quality_of_lecture=> params[:feedback][:quality_of_lecture].to_i, :category=> params[:category].to_i)
    if @feedback_id.save
      #show success message
      #redirect to course feedback forrm with prof rating as a parameter
      redirect_to(:controller => 'home_page', :action => 'home')

    end

  end


  def feedback_params
    params.permit(:id, :user_id, :num_of_exam, :num_of_project,:num_of_assignment,:fav_factor,:section_id,:job,:workload,:grade,:relate_course,:quality_of_lecture,:category)
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
      @fb = @fb5.all
    else
      @fb = @fb5. where(category: params[:feedback][:category])
    end
    lang = params[:feedback][:languages]

    @suggested_courses= []
    @uniq_courses = []
    if lang == '0'
      @final = @fb.all;
    else
      @final = @fb.where("tool_and_lang like ?", "%"+ params[:feedback][:languages]+"%")
    end
    @final.each do |course|
        logger.info "Course-number"+course.course_number
        if @uniq_courses.include? course.course_number or @uniq_courses.include? course.course_number.downcase or @uniq_courses.include? course.course_number.upcase
          #ignore that course
        else
          @uniq_courses.append(course.course_number)
        end
    end
    @uniq_courses.each do |uc|
        logger.info uc
        @suggested_course={}
        @suggested_course["course_number"]=uc
        @suggested_course["title"]=Course.where(:course_number=>uc).first.title
        @suggested_course["level"]=(Course.where(:course_number=>uc).first.level.to_i == 0? "Graduate" : "Undergraduate")
        @department_id = Course.where(:course_number=> uc).first.department_id
        @suggested_course["department"]= Department.where(:id=>@department_id.to_i).first.name
        @suggested_courses.append(@suggested_course)
    end
      logger.info @suggested_courses
    end
    #@fb = Feedback.where(num_of_exam: params[:feedback][:num_of_exam], num_of_project: params[:feedback][:num_of_exam], num_of_assignment: params[:feedback][:num_of_assignment], job_relevance: params[:feedback][:job_relevance], workload: params[:feedback][:workload], category: params[:feedback][:category] )

end

