class Feedback < ApplicationRecord
  validates :course_number, :presence => {:message => "Please enter course number"}
  validates :professor_id, :presence => {:message => "Please enter Professor Id"}
  validates :user_id, :presence => {:message => "Please enter user Id"}
  validates :num_of_exam, :presence => {:message => "Please enter the no. of exams"}
  validates :num_of_project, :presence => {:message => "Please enter the no of projects"}
  validates :num_of_assignment, :presence => {:message => "Please enter the no of assignments"}
  validates :tool_and_lang, :presence => {:message => "Please enter tools and languages"}
  validates :fav_factor, :presence => {:message => "Please enter fav_factor"}
  validates :prof_rating_id, :presence => {:message => "Please enter the prof_rating_id"}
  validates :job_relevance, :presence => {:message => "Please enter the job_relevance"}
  validates :workload, :presence => {:message => "Please enter the workload"}
  validates :grade, :presence => {:message => "Please enter grade"}
  validates :related_course, :presence => {:message => "Please enter the related_course"}
  validates :quality_of_lecture, :presence => {:message => "Please enter the quality_of_lecture"}
  validates :category, :presence => {:message => "Please enter the category"}

end
