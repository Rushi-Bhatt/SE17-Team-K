class Department < ApplicationRecord
  has_many :courses, dependent: :destroy
  validates :name, :presence => {:message => "Please enter the dept name"} , uniqueness: true
end
