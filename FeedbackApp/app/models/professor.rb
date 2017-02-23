class Professor < ApplicationRecord
  has_many :courses
  validates :name, :presence => {:message => "Please enter the name"}, uniqueness: true
end
