class ProfRating < ApplicationRecord
  validates :professor_id, :presence => {:message => "Please enter professor Id"}
  validates :fluency, :presence => {:message => "Please enter the fluency"}
  validates :course_material, :presence => {:message => "Please enter the course_material"}
  validates :knowledge, :presence => {:message => "Please enter the knowledge value"}
  validates :doubt_solving, :presence => {:message => "Please enter doubt_solving rating"}

end
