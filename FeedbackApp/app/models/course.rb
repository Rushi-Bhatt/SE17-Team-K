class Course < ApplicationRecord
  validates :course_id, :presence => {:message => "Please enter Course Id"} , uniqueness: true
  validates :dept_id, :presence => {:message => "Please enter Department Id"}
  validates :level, :presence => {:message => "Please enter the level"}
  validates :title, :presence => {:message => "Please enter the Title"}, uniqueness: true
end
