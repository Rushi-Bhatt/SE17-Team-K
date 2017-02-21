class Section < ApplicationRecord
  validates :course_id, :presence => {:message => "Please enter Course Id"}
  validates :prof_id, :presence => {:message => "Please enter Professor Id"}
  validates :semester, :presence => {:message => "Please enter the Semester"}
end
