class Course < ApplicationRecord
  belongs_to :department
  belongs_to :professor
  has_many :users, :through => :reviews
end
