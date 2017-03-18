class Course < ApplicationRecord
  belongs_to :department
  belongs_to :professor
  has_many :users, :through => :reviews
  has_many :reviews

  validates :course_number, :presence => {:message => "Please enter Course number"} , uniqueness: true
  validates :department_id, :presence => {:message => "Please enter Department Id"}
  validates :professor_id, :presence => {:message => "Please enter Professor Id"}
  validates :level, :presence => {:message => "Please enter the level"}
  validates :title, :presence => {:message => "Please enter the Title"}, uniqueness: true

  before_save :uppercase_course_number

  def uppercase_course_number
    self.course_number.upcase!
  end

  def feed
    Review.where("course_id = ?", id)
  end

  def course_number_and_title
    "#{self.course_number} - #{self.title}"
  end
end
