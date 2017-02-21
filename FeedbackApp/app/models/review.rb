class Review < ApplicationRecord
  validates :section_id, :presence => {:message => "Please enter section Id"}
  validates :user_id, :presence => {:message => "Please enter user Id"}
  validates :review, :presence => {:message => "Please enter the review"}
  validates :like, :presence => {:message => "Please enter the no of likes"}
  validates :dislike, :presence => {:message => "Please enter the no of dislikes"}
end
